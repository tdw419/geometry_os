; DESCRIPTION: Renders a orange line between points (399, 89) and (295, 195).
; PLAN: r0=399(x1), r1=89(y1), r2=295(x2), r3=195(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 89
LDI r2, 295
LDI r3, 195
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
