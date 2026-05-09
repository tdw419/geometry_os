; DESCRIPTION: Renders a yellow line between points (406, 132) and (260, 195).
; PLAN: r0=406(x1), r1=132(y1), r2=260(x2), r3=195(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 132
LDI r2, 260
LDI r3, 195
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
