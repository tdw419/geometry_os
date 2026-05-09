; DESCRIPTION: Renders a blue line between points (153, 253) and (33, 14).
; PLAN: r0=153(x1), r1=253(y1), r2=33(x2), r3=14(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 253
LDI r2, 33
LDI r3, 14
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
