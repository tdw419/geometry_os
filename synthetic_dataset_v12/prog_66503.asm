; DESCRIPTION: Composite: Draws a orange line from (104, 248) to (421, 36) then Draws a red circle centered at (214, 111) with radius 58 then Sets a single yellow pixel at (173, 207).
; PLAN: r0=104(x1), r1=248(y1), r2=421(x2), r3=36(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=214(x), r6=111(y), r7=58(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=173(x), r11=207(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 104
LDI r1, 248
LDI r2, 421
LDI r3, 36
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 111
LDI r7, 58
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 173
LDI r11, 207
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
