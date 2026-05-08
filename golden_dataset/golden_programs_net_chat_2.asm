; DESCRIPTION: Display a object using color colored at the screen.

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
LDI r11, 256            ; screen width
LDI r7, 0              ; frame counter

; Clear screen to dark blue
LDI r12, 0x000033
FILL r12

; Draw title bar
LDI r12, 0x00
LDI r8, 0
LDI r5, 256
LDI r4, 1
LDI r15, 0x333333
RECTF r12, r8, r5, r4, r15

; Draw status bar at bottom
LDI r12, 0
LDI r8, 250
LDI r5, 256
LDI r4, 6
LDI r15, 0x222222
RECTF r12, r8, r5, r4, r15

; Write "Pixel Chat - Waiting..." text at top
LDI r3, 0x2000
LDI r1, 80             ; 'P'
STORE r3, r1
LDI r3, 0x2001
LDI r1, 105            ; 'i'
STORE r3, r1
LDI r3, 0x2002
LDI r1, 120            ; 'x'
STORE r3, r1
LDI r3, 0x2003
LDI r1, 101            ; 'e'
STORE r3, r1
LDI r3, 0x2004
LDI r1, 108            ; 'l'
STORE r3, r1
LDI r3, 0x2005
LDI r1, 0              ; null
STORE r3, r1

LDI r3, 0x2000
LDI r1, 2
LDI r14, 8
LDI r6, 0xFFFFFF
TEXT r3, r1, r6

; Main loop: poll for incoming frames
main_loop:
  ; Update frame counter
  ADD r7, r13
  LDI r12, 0xFFE
  STORE r12, r7

  ; Poll NET_RECV
  LDI r12, 0x7100     ; receive buffer
  LDI r8, 256        ; max length
  NET_RECV r12, r8

  ; Check if we got data (r0 > 0 means data received)
  LDI r5, 0
  CMP r0, r5
  JZ r0, no_data

  ; Data received! Check frame type
  LDI r4, 0x7100
  LOAD r4, r4         ; r4 = frame type
  LDI r15, 1
  CMP r4, r15
  JZ r0, got_chat       ; type 1 = chat message

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
  LDI r8, 250
  LDI r5, 256
  LDI r4, 6
  LDI r15, 0x004400    ; green tint = message received
  RECTF r12, r8, r5, r4, r15
  FRAME
  JMP main_loop

no_data:
  ; Animate waiting indicator (blinking dot)
  LDI r12, 0xFFE
  LOAD r12, r12         ; r12 = TICKS
  LDI r8, 30
  AND r12, r8          ; r12 = TICKS & 30
  LDI r8, 15
  CMP r12, r8
  BLT r0, dot_on

  ; Dot off - draw black pixel at (128, 4)
  LDI r12, 128
  LDI r8, 4
  LDI r5, 0x000000
  PSET r12, r8, r5
  FRAME
  JMP main_loop

dot_on:
  LDI r12, 128
  LDI r8, 4
  LDI r5, 0xFFFFFF
  PSET r12, r8, r5
  FRAME
  JMP main_loop

HALT
