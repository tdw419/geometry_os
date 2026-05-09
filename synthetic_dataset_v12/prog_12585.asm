; DESCRIPTION: Composite: Renders a black disk with center (150, 73) and radius 67 then Sets a single red pixel at (325, 196) then Renders a yellow line between points (352, 219) and (11, 67).
; PLAN: r0=150(x), r1=73(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=325(x), r6=196(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=352(x1), r11=219(y1), r12=11(x2), r13=67(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 150
LDI r1, 73
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 325
LDI r6, 196
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 352
LDI r11, 219
LDI r12, 11
LDI r13, 67
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
