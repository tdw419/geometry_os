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

LDI r13, 1              ; increment constant
LDI r0, 256            ; screen width
LDI r14, 0              ; frame counter

; Clear screen to dark blue
LDI r12, 0x000033
FILL r12

; Draw title bar
LDI r12, 0x00
LDI r3, 0
LDI r11, 256
LDI r8, 1
LDI r2, 0x333333
RECTF r12, r3, r11, r8, r2

; Draw status bar at bottom
LDI r12, 0
LDI r3, 250
LDI r11, 256
LDI r8, 6
LDI r2, 0x222222
RECTF r12, r3, r11, r8, r2

; Write "Pixel Chat - Waiting..." text at top
LDI r7, 0x2000
LDI r1, 80             ; 'P'
STORE r7, r1
LDI r7, 0x2001
LDI r1, 105            ; 'i'
STORE r7, r1
LDI r7, 0x2002
LDI r1, 120            ; 'x'
STORE r7, r1
LDI r7, 0x2003
LDI r1, 101            ; 'e'
STORE r7, r1
LDI r7, 0x2004
LDI r1, 108            ; 'l'
STORE r7, r1
LDI r7, 0x2005
LDI r1, 0              ; null
STORE r7, r1

LDI r7, 0x2000
LDI r1, 2
LDI r4, 8
LDI r6, 0xFFFFFF
TEXT r7, r1, r6

; Main loop: poll for incoming frames
main_loop:
  ; Update frame counter
  ADD r14, r13
  LDI r12, 0xFFE
  STORE r12, r14

  ; Poll NET_RECV
  LDI r12, 0x7100     ; receive buffer
  LDI r3, 256        ; max length
  NET_RECV r12, r3

  ; Check if we got data (r15 > 0 means data received)
  LDI r11, 0
  CMP r15, r11
  JZ r15, no_data

  ; Data received! Check frame type
  LDI r8, 0x7100
  LOAD r8, r8         ; r8 = frame type
  LDI r2, 1
  CMP r8, r2
  JZ r15, got_chat       ; type 1 = chat message

  ; Type 0 = screen share - display pixels
  ; Pixel data starts at 0x7104 (after 4-byte header)
  ; For now, just flash the screen green briefly
  LDI r12, 0x003300
  FILL r12
  FRAME
  JMP main_loop

got_chat:
  ; Chat message received - display in status bar
  ; Change status bar color to indicate message
  LDI r12, 0
  LDI r3, 250
  LDI r11, 256
  LDI r8, 6
  LDI r2, 0x004400    ; green tint = message received
  RECTF r12, r3, r11, r8, r2
  FRAME
  JMP main_loop

no_data:
  ; Animate waiting indicator (blinking dot)
  LDI r12, 0xFFE
  LOAD r12, r12         ; r12 = TICKS
  LDI r3, 30
  AND r12, r3          ; r12 = TICKS & 30
  LDI r3, 15
  CMP r12, r3
  BLT r15, dot_on

  ; Dot off - draw black pixel at (128, 4)
  LDI r12, 128
  LDI r3, 4
  LDI r11, 0x000000
  PSET r12, r3, r11
  FRAME
  JMP main_loop

dot_on:
  LDI r12, 128
  LDI r3, 4
  LDI r11, 0xFFFFFF
  PSET r12, r3, r11
  FRAME
  JMP main_loop

HALT
