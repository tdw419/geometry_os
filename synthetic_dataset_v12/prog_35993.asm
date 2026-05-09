; DESCRIPTION: Composite: Sets a single green pixel at (38, 165) then Creates a purple circular shape at (121, 40) with radius 32 then Renders a purple line between points (328, 46) and (131, 156).
; PLAN: r0=38(x), r1=165(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=121(x), r6=40(y), r7=32(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=328(x1), r11=46(y1), r12=131(x2), r13=156(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 38
LDI r1, 165
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 121
LDI r6, 40
LDI r7, 32
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 328
LDI r11, 46
LDI r12, 131
LDI r13, 156
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
