; DESCRIPTION: Composite: Places a white line segment connecting (332, 163) to (264, 35) then Renders a cyan box of size 42x105 starting at (454, 149) then Creates a magenta circular shape at (444, 152) with radius 60.
; PLAN: r0=332(x1), r1=163(y1), r2=264(x2), r3=35(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=454(x), r6=149(y), r7=42(width), r8=105(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=444(x), r11=152(y), r12=60(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 332
LDI r1, 163
LDI r2, 264
LDI r3, 35
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 454
LDI r6, 149
LDI r7, 42
LDI r8, 105
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 444
LDI r11, 152
LDI r12, 60
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
