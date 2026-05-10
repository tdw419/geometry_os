; DESCRIPTION: Composite: Places a magenta line segment connecting (335, 253) to (120, 152) then Renders a black box of size 52x62 starting at (344, 38) then Places a white circle of radius 71 at center (376, 130).
; PLAN: r0=335(x1), r1=253(y1), r2=120(x2), r3=152(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=344(x), r6=38(y), r7=52(width), r8=62(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=376(x), r11=130(y), r12=71(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 335
LDI r1, 253
LDI r2, 120
LDI r3, 152
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 344
LDI r6, 38
LDI r7, 52
LDI r8, 62
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 376
LDI r11, 130
LDI r12, 71
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
