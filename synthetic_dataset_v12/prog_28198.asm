; DESCRIPTION: Composite: Places a red line segment connecting (474, 32) to (42, 67) then Places a yellow dot at position (328, 191) then Places a purple circle of radius 35 at center (413, 155).
; PLAN: r0=474(x1), r1=32(y1), r2=42(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=328(x), r6=191(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=413(x), r11=155(y), r12=35(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 474
LDI r1, 32
LDI r2, 42
LDI r3, 67
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 328
LDI r6, 191
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 413
LDI r11, 155
LDI r12, 35
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
