; DESCRIPTION: Composite: Renders a blue box of size 85x58 starting at (9, 169) then Renders a red line between points (256, 137) and (439, 9) then Draws a white circle centered at (228, 129) with radius 21.
; PLAN: r0=9(x), r1=169(y), r2=85(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=256(x1), r6=137(y1), r7=439(x2), r8=9(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=228(x), r11=129(y), r12=21(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 9
LDI r1, 169
LDI r2, 85
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 256
LDI r6, 137
LDI r7, 439
LDI r8, 9
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 228
LDI r11, 129
LDI r12, 21
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
