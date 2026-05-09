; DESCRIPTION: Renders a black line between points (468, 106) and (176, 202).
; PLAN: r0=468(x1), r1=106(y1), r2=176(x2), r3=202(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 106
LDI r2, 176
LDI r3, 202
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
