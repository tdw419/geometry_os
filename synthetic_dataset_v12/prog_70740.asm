; DESCRIPTION: Composite: Places a purple line segment connecting (408, 59) to (312, 67) then Creates a cyan circular shape at (240, 123) with radius 30 then Sets a single white pixel at (413, 200).
; PLAN: r0=408(x1), r1=59(y1), r2=312(x2), r3=67(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=240(x), r6=123(y), r7=30(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=413(x), r11=200(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 408
LDI r1, 59
LDI r2, 312
LDI r3, 67
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 123
LDI r7, 30
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 413
LDI r11, 200
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
