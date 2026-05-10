; DESCRIPTION: Renders a yellow line between points (307, 191) and (495, 227).
; PLAN: r0=307(x1), r1=191(y1), r2=495(x2), r3=227(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 191
LDI r2, 495
LDI r3, 227
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
