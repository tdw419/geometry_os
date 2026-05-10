; DESCRIPTION: Renders a yellow line between points (470, 115) and (301, 132).
; PLAN: r0=470(x1), r1=115(y1), r2=301(x2), r3=132(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 115
LDI r2, 301
LDI r3, 132
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
