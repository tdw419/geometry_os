; DESCRIPTION: Draws a yellow rectangle at (429, 103) with width 83 and height 106.
; PLAN: r0=429(x), r1=103(y), r2=83(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 103
LDI r2, 83
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
