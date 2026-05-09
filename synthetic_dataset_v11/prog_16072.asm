; DESCRIPTION: Renders a blue line between points (153, 207) and (48, 243).
; PLAN: r0=153(x1), r1=207(y1), r2=48(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 207
LDI r2, 48
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
