; DESCRIPTION: Renders a yellow line between points (135, 34) and (218, 153).
; PLAN: r0=135(x1), r1=34(y1), r2=218(x2), r3=153(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 34
LDI r2, 218
LDI r3, 153
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
