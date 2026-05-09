; DESCRIPTION: Renders a blue line between points (255, 39) and (149, 234).
; PLAN: r0=255(x1), r1=39(y1), r2=149(x2), r3=234(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 39
LDI r2, 149
LDI r3, 234
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
