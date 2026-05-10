; DESCRIPTION: Composite: Renders a white disk with center (349, 134) and radius 13 then Renders a black box of size 118x106 starting at (52, 137) then Places a orange line segment connecting (407, 199) to (456, 86).
; PLAN: r0=349(x), r1=134(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=52(x), r6=137(y), r7=118(width), r8=106(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=407(x1), r11=199(y1), r12=456(x2), r13=86(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 349
LDI r1, 134
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 52
LDI r6, 137
LDI r7, 118
LDI r8, 106
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 407
LDI r11, 199
LDI r12, 456
LDI r13, 86
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
