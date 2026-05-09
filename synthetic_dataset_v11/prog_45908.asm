; DESCRIPTION: Renders a orange line between points (208, 20) and (205, 187).
; PLAN: r0=208(x1), r1=20(y1), r2=205(x2), r3=187(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 20
LDI r2, 205
LDI r3, 187
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
