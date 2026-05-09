; DESCRIPTION: Renders a blue line between points (135, 243) and (193, 46).
; PLAN: r0=135(x1), r1=243(y1), r2=193(x2), r3=46(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 243
LDI r2, 193
LDI r3, 46
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
