; DESCRIPTION: Renders a blue line between points (234, 141) and (255, 38).
; PLAN: r0=234(x1), r1=141(y1), r2=255(x2), r3=38(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 141
LDI r2, 255
LDI r3, 38
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
