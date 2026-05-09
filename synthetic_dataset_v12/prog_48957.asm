; DESCRIPTION: Draws a blue rectangle at (315, 197) with width 19 and height 32.
; PLAN: r0=315(x), r1=197(y), r2=19(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 197
LDI r2, 19
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
