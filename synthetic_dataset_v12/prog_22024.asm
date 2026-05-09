; DESCRIPTION: Renders a black line between points (427, 205) and (150, 54).
; PLAN: r0=427(x1), r1=205(y1), r2=150(x2), r3=54(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 205
LDI r2, 150
LDI r3, 54
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
