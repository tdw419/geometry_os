; DESCRIPTION: Renders a yellow line between points (90, 141) and (135, 7).
; PLAN: r0=90(x1), r1=141(y1), r2=135(x2), r3=7(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 141
LDI r2, 135
LDI r3, 7
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
