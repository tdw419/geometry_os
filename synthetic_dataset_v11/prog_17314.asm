; DESCRIPTION: Draws a orange line from (184, 208) to (155, 154).
; PLAN: r0=184(x1), r1=208(y1), r2=155(x2), r3=154(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 208
LDI r2, 155
LDI r3, 154
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
