; DESCRIPTION: Renders a yellow line between points (176, 90) and (468, 75).
; PLAN: r0=176(x1), r1=90(y1), r2=468(x2), r3=75(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 90
LDI r2, 468
LDI r3, 75
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
