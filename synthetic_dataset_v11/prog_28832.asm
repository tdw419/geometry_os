; DESCRIPTION: Renders a yellow line between points (96, 254) and (99, 220).
; PLAN: r0=96(x1), r1=254(y1), r2=99(x2), r3=220(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 254
LDI r2, 99
LDI r3, 220
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
