; DESCRIPTION: Composite: Sets a single black pixel at (104, 115) then Creates a purple circular shape at (268, 75) with radius 60 then Draws a orange line from (256, 95) to (503, 20).
; PLAN: r0=104(x), r1=115(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=268(x), r6=75(y), r7=60(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=256(x1), r11=95(y1), r12=503(x2), r13=20(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 104
LDI r1, 115
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 268
LDI r6, 75
LDI r7, 60
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 256
LDI r11, 95
LDI r12, 503
LDI r13, 20
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
