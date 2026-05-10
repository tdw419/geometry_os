; DESCRIPTION: Composite: Places a magenta line segment connecting (195, 60) to (506, 56) then Places a purple circle of radius 12 at center (84, 204).
; PLAN: r0=195(x1), r1=60(y1), r2=506(x2), r3=56(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=84(x), r6=204(y), r7=12(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 195
LDI r1, 60
LDI r2, 506
LDI r3, 56
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 204
LDI r7, 12
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
