; DESCRIPTION: Places a green line segment connecting (222, 25) to (341, 177).
; PLAN: r0=222(x1), r1=25(y1), r2=341(x2), r3=177(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 25
LDI r2, 341
LDI r3, 177
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
