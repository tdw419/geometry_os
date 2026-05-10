; DESCRIPTION: Renders a blue line between points (243, 194) and (508, 29).
; PLAN: r0=243(x1), r1=194(y1), r2=508(x2), r3=29(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 194
LDI r2, 508
LDI r3, 29
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
