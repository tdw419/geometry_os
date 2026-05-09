; DESCRIPTION: Renders a blue line between points (32, 124) and (185, 6).
; PLAN: r0=32(x1), r1=124(y1), r2=185(x2), r3=6(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 124
LDI r2, 185
LDI r3, 6
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
