; DESCRIPTION: Composite: Places a purple line segment connecting (148, 85) to (322, 131) then Places a magenta circle of radius 64 at center (312, 84).
; PLAN: r0=148(x1), r1=85(y1), r2=322(x2), r3=131(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=312(x), r6=84(y), r7=64(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 148
LDI r1, 85
LDI r2, 322
LDI r3, 131
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 84
LDI r7, 64
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
