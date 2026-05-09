; DESCRIPTION: Composite: Sets a single green pixel at (284, 230) then Creates a purple circular shape at (315, 130) with radius 61 then Renders a orange line between points (401, 108) and (476, 72).
; PLAN: r0=284(x), r1=230(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=315(x), r6=130(y), r7=61(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=401(x1), r11=108(y1), r12=476(x2), r13=72(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 284
LDI r1, 230
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 315
LDI r6, 130
LDI r7, 61
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 401
LDI r11, 108
LDI r12, 476
LDI r13, 72
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
