; DESCRIPTION: Places a blue line segment connecting (366, 157) to (425, 253).
; PLAN: r0=366(x1), r1=157(y1), r2=425(x2), r3=253(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 157
LDI r2, 425
LDI r3, 253
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
