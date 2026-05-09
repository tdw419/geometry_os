; DESCRIPTION: Draws a blue rectangle at (66, 38) with width 18 and height 109.
; PLAN: r0=66(x), r1=38(y), r2=18(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 38
LDI r2, 18
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
