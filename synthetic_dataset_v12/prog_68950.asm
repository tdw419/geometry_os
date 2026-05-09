; DESCRIPTION: Places a yellow line segment connecting (307, 135) to (341, 18).
; PLAN: r0=307(x1), r1=135(y1), r2=341(x2), r3=18(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 135
LDI r2, 341
LDI r3, 18
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
