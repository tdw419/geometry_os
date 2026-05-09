; DESCRIPTION: Renders a purple line between points (153, 212) and (240, 33).
; PLAN: r0=153(x1), r1=212(y1), r2=240(x2), r3=33(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 212
LDI r2, 240
LDI r3, 33
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
