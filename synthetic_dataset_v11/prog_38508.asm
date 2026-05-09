; DESCRIPTION: Renders a red line between points (2, 137) and (23, 91).
; PLAN: r0=2(x1), r1=137(y1), r2=23(x2), r3=91(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 137
LDI r2, 23
LDI r3, 91
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
