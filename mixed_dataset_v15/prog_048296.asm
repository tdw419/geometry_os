; DESCRIPTION: Renders a blue line between points (353, 11) and (154, 196).
; PLAN: r0=353(x1), r1=11(y1), r2=154(x2), r3=196(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 11
LDI r2, 154
LDI r3, 196
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
