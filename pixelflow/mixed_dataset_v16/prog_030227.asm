; DESCRIPTION: Composite: Places a red 17x50 rectangle at position (73, 4) then Renders a yellow line between points (290, 41) and (129, 144) then Places a orange circle of radius 71 at center (244, 161).
; PLAN: r0=73(x), r1=4(y), r2=17(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=290(x1), r6=41(y1), r7=129(x2), r8=144(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=244(x), r11=161(y), r12=71(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 73
LDI r1, 4
LDI r2, 17
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 290
LDI r6, 41
LDI r7, 129
LDI r8, 144
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 244
LDI r11, 161
LDI r12, 71
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
