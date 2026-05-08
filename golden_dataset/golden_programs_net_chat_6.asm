; DESCRIPTION: This GeOS assembly code implements a pixel-based chat demo that listens for incoming network frames using the NET_RECV function. It displays received pixel data on the screen and shows text messages in a status bar. The demo also includes a simple animated waiting indicator to signify activity.

; net_chat.asm -- Pixel Chat Demo (Phase 71: Pixel Network Protocol)
;
; Demonstrates bidirectional NET_RECV for receiving pixel data from a peer.
; Listens for incoming pixel protocol frames and displays them on screen.
; Also shows a simple text interface using NET_SEND for chat messages.
;
; For testing without a real network: push frames into vm.net_inbox
; using the test harness. The demo polls NET_RECV each frame.
;
; Protocol:
;   Frame type 0 (screen_share): display pixels on screen
;   Frame type 1 (chat): display text message in status bar

LDI r11, 1              ; increment constant
LDI r10, 256            ; screen width
LDI r14, 0              ; frame counter

; Clear screen to dark blue
LDI r3, 0x000033
FILL r3

; Draw title bar
LDI r3, 0x00
LDI r9, 0
LDI r12, 256
LDI r8, 1
LDI r5, 0x333333
RECTF r3, r9, r12, r8, r5

; Draw status bar at bottom
LDI r3, 0
LDI r9, 250
LDI r12, 256
LDI r8, 6
LDI r5, 0x222222
RECTF r3, r9, r12, r8, r5

; Write "Pixel Chat - Waiting..." text at top
LDI r15, 0x2000
LDI r6, 80             ; 'P'
STORE r15, r6
LDI r15, 0x2001
LDI r6, 105            ; 'i'
STORE r15, r6
LDI r15, 0x2002
LDI r6, 120            ; 'x'
STORE r15, r6
LDI r15, 0x2003
LDI r6, 101            ; 'e'
STORE r15, r6
LDI r15, 0x2004
LDI r6, 108            ; 'l'
STORE r15, r6
LDI r15, 0x2005
LDI r6, 0              ; null
STORE r15, r6

LDI r15, 0x2000
LDI r6, 2
LDI r4, 8
LDI r1, 0xFFFFFF
TEXT r15, r6, r1

; Main loop: poll for incoming frames
main_loop:
  ; Update frame counter
  ADD r14, r11
  LDI r3, 0xFFE
  STORE r3, r14

  ; Poll NET_RECV
  LDI r3, 0x7100     ; receive buffer
  LDI r9, 256        ; max length
  NET_RECV r3, r9

  ; Check if we got data (r7 > 0 means data received)
  LDI r12, 0
  CMP r7, r12
  JZ r7, no_data

  ; Data received! Check frame type
  LDI r8, 0x7100
  LOAD r8, r8         ; r8 = frame type
  LDI r5, 1
  CMP r8, r5
  JZ r7, got_chat       ; type 1 = chat message

  ; Type 0 = screen share - display pixels
  ; Pixel data starts at 0x7104 (after 4-byte header)
  ; For now, just flash the screen green briefly
  LDI r3, 0x003300
  FILL r3
  FRAME
  JMP main_loop

got_chat:
  ; Chat message received - display in status bar
  ; Change status bar color to indicate message
  LDI r3, 0
  LDI r9, 250
  LDI r12, 256
  LDI r8, 6
  LDI r5, 0x004400    ; green tint = message received
  RECTF r3, r9, r12, r8, r5
  FRAME
  JMP main_loop

no_data:
  ; Animate waiting indicator (blinking dot)
  LDI r3, 0xFFE
  LOAD r3, r3         ; r3 = TICKS
  LDI r9, 30
  AND r3, r9          ; r3 = TICKS & 30
  LDI r9, 15
  CMP r3, r9
  BLT r7, dot_on

  ; Dot off - draw black pixel at (128, 4)
  LDI r3, 128
  LDI r9, 4
  LDI r12, 0x000000
  PSET r3, r9, r12
  FRAME
  JMP main_loop

dot_on:
  LDI r3, 128
  LDI r9, 4
  LDI r12, 0xFFFFFF
  PSET r3, r9, r12
  FRAME
  JMP main_loop

HALT
