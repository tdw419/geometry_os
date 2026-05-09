; DESCRIPTION: Draws a blue rectangle at (140, 205) with width 49 and height 24.
; PLAN: r0=140(x), r1=205(y), r2=49(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 205
LDI r2, 49
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
