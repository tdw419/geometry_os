; DESCRIPTION: Composite: Renders a yellow line between points (42, 5) and (509, 29) then Renders a magenta box of size 106x23 starting at (218, 156) then Creates a green circular shape at (189, 90) with radius 60.
; PLAN: r0=42(x1), r1=5(y1), r2=509(x2), r3=29(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=218(x), r6=156(y), r7=106(width), r8=23(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=189(x), r11=90(y), r12=60(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 42
LDI r1, 5
LDI r2, 509
LDI r3, 29
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 156
LDI r7, 106
LDI r8, 23
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 189
LDI r11, 90
LDI r12, 60
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
