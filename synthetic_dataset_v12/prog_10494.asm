; DESCRIPTION: Places a blue line segment connecting (159, 135) to (166, 221).
; PLAN: r0=159(x1), r1=135(y1), r2=166(x2), r3=221(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 135
LDI r2, 166
LDI r3, 221
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
