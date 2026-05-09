; DESCRIPTION: Composite: Places a green dot at position (57, 49) then Renders a orange disk with center (188, 200) and radius 11 then Renders a green box of size 63x65 starting at (222, 157).
; PLAN: r0=57(x), r1=49(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=188(x), r6=200(y), r7=11(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=222(x), r11=157(y), r12=63(width), r13=65(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 57
LDI r1, 49
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 188
LDI r6, 200
LDI r7, 11
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 222
LDI r11, 157
LDI r12, 63
LDI r13, 65
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
