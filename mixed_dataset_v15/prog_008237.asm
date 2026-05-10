; DESCRIPTION: Renders a cyan line between points (427, 169) and (123, 99).
; PLAN: r0=427(x1), r1=169(y1), r2=123(x2), r3=99(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 169
LDI r2, 123
LDI r3, 99
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
