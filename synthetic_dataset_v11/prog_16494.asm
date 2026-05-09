; DESCRIPTION: Renders a orange line between points (179, 193) and (23, 117).
; PLAN: r0=179(x1), r1=193(y1), r2=23(x2), r3=117(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 193
LDI r2, 23
LDI r3, 117
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
