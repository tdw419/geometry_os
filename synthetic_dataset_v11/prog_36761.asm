; DESCRIPTION: Renders a yellow line between points (135, 121) and (211, 202).
; PLAN: r0=135(x1), r1=121(y1), r2=211(x2), r3=202(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 121
LDI r2, 211
LDI r3, 202
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
