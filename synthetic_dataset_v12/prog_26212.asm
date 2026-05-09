; DESCRIPTION: Renders a green line between points (505, 148) and (490, 249).
; PLAN: r0=505(x1), r1=148(y1), r2=490(x2), r3=249(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 148
LDI r2, 490
LDI r3, 249
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
