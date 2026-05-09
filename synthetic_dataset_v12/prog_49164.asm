; DESCRIPTION: Composite: Sets a single orange pixel at (330, 244) then Places a red circle of radius 61 at center (231, 86) then Places a black line segment connecting (447, 135) to (135, 10).
; PLAN: r0=330(x), r1=244(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=231(x), r6=86(y), r7=61(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=447(x1), r11=135(y1), r12=135(x2), r13=10(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 330
LDI r1, 244
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 231
LDI r6, 86
LDI r7, 61
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 447
LDI r11, 135
LDI r12, 135
LDI r13, 10
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
