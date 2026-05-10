; DESCRIPTION: Renders a blue line between points (292, 90) and (210, 39).
; PLAN: r0=292(x1), r1=90(y1), r2=210(x2), r3=39(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 90
LDI r2, 210
LDI r3, 39
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
