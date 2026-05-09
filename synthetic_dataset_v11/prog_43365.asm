; DESCRIPTION: Draws a blue rectangle at (215, 7) with width 25 and height 58.
; PLAN: r0=215(x), r1=7(y), r2=25(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 7
LDI r2, 25
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
