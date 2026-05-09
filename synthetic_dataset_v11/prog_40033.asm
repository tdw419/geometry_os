; DESCRIPTION: Places a blue line segment connecting (75, 233) to (114, 142).
; PLAN: r0=75(x1), r1=233(y1), r2=114(x2), r3=142(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 233
LDI r2, 114
LDI r3, 142
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
