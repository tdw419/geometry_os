; DESCRIPTION: Draws a blue rectangle at (66, 89) with width 111 and height 103.
; PLAN: r0=66(x), r1=89(y), r2=111(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 89
LDI r2, 111
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
