; DESCRIPTION: Composite: Creates a purple circular shape at (364, 153) with radius 56 then Places a magenta line segment connecting (135, 83) to (131, 95).
; PLAN: r0=364(x), r1=153(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=135(x1), r6=83(y1), r7=131(x2), r8=95(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 364
LDI r1, 153
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 135
LDI r6, 83
LDI r7, 131
LDI r8, 95
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
