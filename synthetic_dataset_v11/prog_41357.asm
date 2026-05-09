; DESCRIPTION: Renders a blue line between points (75, 60) and (194, 127).
; PLAN: r0=75(x1), r1=60(y1), r2=194(x2), r3=127(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 60
LDI r2, 194
LDI r3, 127
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
