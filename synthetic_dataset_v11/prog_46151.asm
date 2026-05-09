; DESCRIPTION: Draws a red rectangle at (106, 52) with width 111 and height 100.
; PLAN: r0=106(x), r1=52(y), r2=111(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 52
LDI r2, 111
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
