; DESCRIPTION: Places a blue line segment connecting (510, 177) to (274, 193).
; PLAN: r0=510(x1), r1=177(y1), r2=274(x2), r3=193(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 177
LDI r2, 274
LDI r3, 193
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
