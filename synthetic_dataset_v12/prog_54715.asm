; DESCRIPTION: Composite: Sets a single purple pixel at (230, 151) then Places a yellow circle of radius 40 at center (364, 56) then Places a purple line segment connecting (213, 210) to (417, 101).
; PLAN: r0=230(x), r1=151(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=364(x), r6=56(y), r7=40(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=213(x1), r11=210(y1), r12=417(x2), r13=101(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 230
LDI r1, 151
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 364
LDI r6, 56
LDI r7, 40
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 213
LDI r11, 210
LDI r12, 417
LDI r13, 101
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
