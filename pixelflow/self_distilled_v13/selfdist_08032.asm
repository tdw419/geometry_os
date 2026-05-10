; DESCRIPTION: Draws a blue rectangle at (182, 170) with width 95 and height 106.
; PLAN: r0=182(x), r1=170(y), r2=95(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 170
LDI r2, 95
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
