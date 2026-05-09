; DESCRIPTION: Renders a black line between points (101, 206) and (489, 0).
; PLAN: r0=101(x1), r1=206(y1), r2=489(x2), r3=0(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 206
LDI r2, 489
LDI r3, 0
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
