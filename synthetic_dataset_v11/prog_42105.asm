; DESCRIPTION: Renders a blue line between points (255, 98) and (140, 25).
; PLAN: r0=255(x1), r1=98(y1), r2=140(x2), r3=25(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 98
LDI r2, 140
LDI r3, 25
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
