; DESCRIPTION: Composite: Renders a cyan box of size 11x21 starting at (278, 8) then Sets a single green pixel at (444, 214) then Creates a orange circular shape at (92, 210) with radius 14.
; PLAN: r0=278(x), r1=8(y), r2=11(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=444(x), r6=214(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=92(x), r11=210(y), r12=14(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 278
LDI r1, 8
LDI r2, 11
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 444
LDI r6, 214
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 92
LDI r11, 210
LDI r12, 14
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
