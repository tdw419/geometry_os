; DESCRIPTION: Renders a orange line between points (430, 129) and (60, 157).
; PLAN: r0=430(x1), r1=129(y1), r2=60(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 129
LDI r2, 60
LDI r3, 157
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
