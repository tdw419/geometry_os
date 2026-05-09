; DESCRIPTION: Composite: Renders a green line between points (411, 140) and (28, 228) then Places a yellow 85x26 rectangle at position (237, 78) then Creates a white circular shape at (245, 172) with radius 23.
; PLAN: r0=411(x1), r1=140(y1), r2=28(x2), r3=228(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=237(x), r6=78(y), r7=85(width), r8=26(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=245(x), r11=172(y), r12=23(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 411
LDI r1, 140
LDI r2, 28
LDI r3, 228
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 78
LDI r7, 85
LDI r8, 26
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 245
LDI r11, 172
LDI r12, 23
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
