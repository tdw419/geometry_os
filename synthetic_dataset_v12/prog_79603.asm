; DESCRIPTION: Renders a red line between points (427, 229) and (218, 91).
; PLAN: r0=427(x1), r1=229(y1), r2=218(x2), r3=91(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 229
LDI r2, 218
LDI r3, 91
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
