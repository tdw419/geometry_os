; DESCRIPTION: Renders a yellow line between points (68, 70) and (148, 237).
; PLAN: r0=68(x1), r1=70(y1), r2=148(x2), r3=237(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 70
LDI r2, 148
LDI r3, 237
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
