; DESCRIPTION: Renders a cyan line between points (137, 99) and (132, 200).
; PLAN: r0=137(x1), r1=99(y1), r2=132(x2), r3=200(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 99
LDI r2, 132
LDI r3, 200
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
