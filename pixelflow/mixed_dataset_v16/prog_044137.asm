; DESCRIPTION: Renders a cyan line between points (191, 203) and (432, 145).
; PLAN: r0=191(x1), r1=203(y1), r2=432(x2), r3=145(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 203
LDI r2, 432
LDI r3, 145
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
