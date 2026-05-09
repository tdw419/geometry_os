; DESCRIPTION: Renders a orange line between points (156, 208) and (75, 193).
; PLAN: r0=156(x1), r1=208(y1), r2=75(x2), r3=193(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 208
LDI r2, 75
LDI r3, 193
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
