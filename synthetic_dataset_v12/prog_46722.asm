; DESCRIPTION: Renders a yellow line between points (364, 185) and (33, 206).
; PLAN: r0=364(x1), r1=185(y1), r2=33(x2), r3=206(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 185
LDI r2, 33
LDI r3, 206
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
