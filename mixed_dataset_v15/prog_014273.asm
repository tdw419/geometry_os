; DESCRIPTION: Composite: Draws a orange line from (288, 96) to (3, 64) then Draws a yellow circle centered at (349, 138) with radius 39 then Creates a cyan rectangular region at (43, 6) spanning 102 by 14 pixels.
; PLAN: r0=288(x1), r1=96(y1), r2=3(x2), r3=64(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=349(x), r6=138(y), r7=39(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=43(x), r11=6(y), r12=102(width), r13=14(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 288
LDI r1, 96
LDI r2, 3
LDI r3, 64
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 138
LDI r7, 39
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 43
LDI r11, 6
LDI r12, 102
LDI r13, 14
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
