; DESCRIPTION: Places a blue line segment connecting (105, 16) to (174, 24).
; PLAN: r0=105(x1), r1=16(y1), r2=174(x2), r3=24(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 16
LDI r2, 174
LDI r3, 24
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
