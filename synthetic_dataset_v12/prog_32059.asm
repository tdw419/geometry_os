; DESCRIPTION: Composite: Draws a red circle centered at (369, 104) with radius 31 then Sets a single green pixel at (27, 38) then Renders a black box of size 50x28 starting at (79, 8).
; PLAN: r0=369(x), r1=104(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=27(x), r6=38(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=79(x), r11=8(y), r12=50(width), r13=28(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 369
LDI r1, 104
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 27
LDI r6, 38
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 79
LDI r11, 8
LDI r12, 50
LDI r13, 28
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
