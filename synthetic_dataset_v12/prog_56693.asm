; DESCRIPTION: Composite: Sets a single magenta pixel at (304, 249) then Places a yellow line segment connecting (147, 191) to (214, 202) then Places a yellow circle of radius 49 at center (271, 86).
; PLAN: r0=304(x), r1=249(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=147(x1), r6=191(y1), r7=214(x2), r8=202(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=271(x), r11=86(y), r12=49(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 304
LDI r1, 249
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 147
LDI r6, 191
LDI r7, 214
LDI r8, 202
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 271
LDI r11, 86
LDI r12, 49
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
