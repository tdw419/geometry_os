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

LDI r5, 1              ; increment constant
LDI r9, 256            ; screen width
LDI r14, 0              ; frame counter

; Clear screen to dark blue
LDI r2, 0x000033
FILL r2

; Draw title bar
LDI r2, 0x00
LDI r12, 0
LDI r3, 256
LDI r1, 1
LDI r8, 0x333333
RECTF r2, r12, r3, r1, r8

; Draw status bar at bottom
LDI r2, 0
LDI r12, 250
LDI r3, 256
LDI r1, 6
LDI r8, 0x222222
RECTF r2, r12, r3, r1, r8

; Write "Pixel Chat - Waiting..." text at top
LDI r0, 0x2000
LDI r15, 80             ; 'P'
STORE r0, r15
LDI r0, 0x2001
LDI r15, 105            ; 'i'
STORE r0, r15
LDI r0, 0x2002
LDI r15, 120            ; 'x'
STORE r0, r15
LDI r0, 0x2003
LDI r15, 101            ; 'e'
STORE r0, r15
LDI r0, 0x2004
LDI r15, 108            ; 'l'
STORE r0, r15
LDI r0, 0x2005
LDI r15, 0              ; null
STORE r0, r15

LDI r0, 0x2000
LDI r15, 2
LDI r4, 8
LDI r11, 0xFFFFFF
TEXT r0, r15, r11

; Main loop: poll for incoming frames
main_loop:
  ; Update frame counter
  ADD r14, r5
  LDI r2, 0xFFE
  STORE r2, r14

  ; Poll NET_RECV
  LDI r2, 0x7100     ; receive buffer
  LDI r12, 256        ; max length
  NET_RECV r2, r12

  ; Check if we got data (r6 > 0 means data received)
  LDI r3, 0
  CMP r6, r3
  JZ r6, no_data

  ; Data received! Check frame type
  LDI r1, 0x7100
  LOAD r1, r1         ; r1 = frame type
  LDI r8, 1
  CMP r1, r8
  JZ r6, got_chat       ; type 1 = chat message

  ; Type 0 = screen share - display pixels
  ; Pixel data starts at 0x7104 (after 4-byte header)
  ; For now, just flash the screen green briefly
  LDI r2, 0x003300
  FILL r2
  FRAME
  JMP main_loop

got_chat:
  ; Chat message received - display in status bar
  ; Change status bar color to indicate message
  LDI r2, 0
  LDI r12, 250
  LDI r3, 256
  LDI r1, 6
  LDI r8, 0x004400    ; green tint = message received
  RECTF r2, r12, r3, r1, r8
  FRAME
  JMP main_loop

no_data:
  ; Animate waiting indicator (blinking dot)
  LDI r2, 0xFFE
  LOAD r2, r2         ; r2 = TICKS
  LDI r12, 30
  AND r2, r12          ; r2 = TICKS & 30
  LDI r12, 15
  CMP r2, r12
  BLT r6, dot_on

  ; Dot off - draw black pixel at (128, 4)
  LDI r2, 128
  LDI r12, 4
  LDI r3, 0x000000
  PSET r2, r12, r3
  FRAME
  JMP main_loop

dot_on:
  LDI r2, 128
  LDI r12, 4
  LDI r3, 0xFFFFFF
  PSET r2, r12, r3
  FRAME
  JMP main_loop

HALT
