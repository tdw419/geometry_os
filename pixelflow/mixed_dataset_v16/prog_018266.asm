; DESCRIPTION: Composite: Sets a single blue pixel at (281, 21) then Draws a orange circle centered at (282, 161) with radius 76 then Renders a orange box of size 33x110 starting at (148, 99).
; PLAN: r0=281(x), r1=21(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=282(x), r6=161(y), r7=76(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=148(x), r11=99(y), r12=33(width), r13=110(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 281
LDI r1, 21
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 282
LDI r6, 161
LDI r7, 76
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 148
LDI r11, 99
LDI r12, 33
LDI r13, 110
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
