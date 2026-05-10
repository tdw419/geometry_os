; DESCRIPTION: Renders a yellow line between points (508, 38) and (29, 196).
; PLAN: r0=508(x1), r1=38(y1), r2=29(x2), r3=196(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 38
LDI r2, 29
LDI r3, 196
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
