; DESCRIPTION: Renders a yellow line between points (33, 106) and (44, 128).
; PLAN: r0=33(x1), r1=106(y1), r2=44(x2), r3=128(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 106
LDI r2, 44
LDI r3, 128
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
