; DESCRIPTION: Composite: Places a orange circle of radius 79 at center (186, 86) then Creates a blue rectangular region at (173, 69) spanning 101 by 105 pixels then Places a black line segment connecting (228, 1) to (365, 75).
; PLAN: r0=186(x), r1=86(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=173(x), r6=69(y), r7=101(width), r8=105(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=228(x1), r11=1(y1), r12=365(x2), r13=75(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 186
LDI r1, 86
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 173
LDI r6, 69
LDI r7, 101
LDI r8, 105
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 228
LDI r11, 1
LDI r12, 365
LDI r13, 75
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
