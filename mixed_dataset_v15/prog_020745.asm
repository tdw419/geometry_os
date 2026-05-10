; DESCRIPTION: Composite: Places a yellow circle of radius 50 at center (131, 167) then Renders a white line between points (281, 71) and (443, 237) then Creates a black rectangular region at (227, 117) spanning 79 by 91 pixels.
; PLAN: r0=131(x), r1=167(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=281(x1), r6=71(y1), r7=443(x2), r8=237(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=227(x), r11=117(y), r12=79(width), r13=91(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 131
LDI r1, 167
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 281
LDI r6, 71
LDI r7, 443
LDI r8, 237
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 227
LDI r11, 117
LDI r12, 79
LDI r13, 91
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
