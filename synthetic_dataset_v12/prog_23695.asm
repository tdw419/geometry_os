; DESCRIPTION: Composite: Renders a purple disk with center (331, 73) and radius 64 then Places a magenta line segment connecting (87, 173) to (472, 114).
; PLAN: r0=331(x), r1=73(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=87(x1), r6=173(y1), r7=472(x2), r8=114(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 331
LDI r1, 73
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 87
LDI r6, 173
LDI r7, 472
LDI r8, 114
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
