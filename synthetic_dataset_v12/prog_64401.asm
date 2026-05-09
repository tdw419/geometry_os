; DESCRIPTION: Renders a orange line between points (423, 193) and (167, 186).
; PLAN: r0=423(x1), r1=193(y1), r2=167(x2), r3=186(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 193
LDI r2, 167
LDI r3, 186
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
