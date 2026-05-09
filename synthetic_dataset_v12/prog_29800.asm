; DESCRIPTION: Draws a orange line from (50, 129) to (95, 158).
; PLAN: r0=50(x1), r1=129(y1), r2=95(x2), r3=158(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 129
LDI r2, 95
LDI r3, 158
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
