; DESCRIPTION: Draws a purple rectangle at (154, 106) with width 44 and height 26.
; PLAN: r0=154(x), r1=106(y), r2=44(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 106
LDI r2, 44
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
