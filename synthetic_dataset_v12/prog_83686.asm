; DESCRIPTION: Renders a blue line between points (416, 226) and (420, 35).
; PLAN: r0=416(x1), r1=226(y1), r2=420(x2), r3=35(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 226
LDI r2, 420
LDI r3, 35
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
