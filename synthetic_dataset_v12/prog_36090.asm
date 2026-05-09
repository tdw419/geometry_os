; DESCRIPTION: Renders a blue line between points (441, 117) and (74, 240).
; PLAN: r0=441(x1), r1=117(y1), r2=74(x2), r3=240(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 117
LDI r2, 74
LDI r3, 240
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
