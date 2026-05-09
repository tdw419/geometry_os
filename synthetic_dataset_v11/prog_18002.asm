; DESCRIPTION: Places a blue line segment connecting (154, 17) to (167, 66).
; PLAN: r0=154(x1), r1=17(y1), r2=167(x2), r3=66(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 17
LDI r2, 167
LDI r3, 66
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
