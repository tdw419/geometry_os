; DESCRIPTION: Composite: Renders a yellow box of size 81x52 starting at (117, 48) then Sets a single green pixel at (465, 14) then Creates a cyan circular shape at (288, 96) with radius 43.
; PLAN: r0=117(x), r1=48(y), r2=81(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=465(x), r6=14(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=288(x), r11=96(y), r12=43(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 117
LDI r1, 48
LDI r2, 81
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 465
LDI r6, 14
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 288
LDI r11, 96
LDI r12, 43
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
