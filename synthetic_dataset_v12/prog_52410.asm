; DESCRIPTION: Renders a blue line between points (264, 126) and (114, 227).
; PLAN: r0=264(x1), r1=126(y1), r2=114(x2), r3=227(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 126
LDI r2, 114
LDI r3, 227
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
