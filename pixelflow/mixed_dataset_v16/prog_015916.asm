; DESCRIPTION: Renders a blue line between points (45, 47) and (16, 226).
; PLAN: r0=45(x1), r1=47(y1), r2=16(x2), r3=226(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 47
LDI r2, 16
LDI r3, 226
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
