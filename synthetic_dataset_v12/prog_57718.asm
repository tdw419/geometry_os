; DESCRIPTION: Draws a yellow rectangle at (260, 125) with width 15 and height 82.
; PLAN: r0=260(x), r1=125(y), r2=15(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 125
LDI r2, 15
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
