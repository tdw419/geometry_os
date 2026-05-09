; DESCRIPTION: Composite: Renders a orange line between points (390, 177) and (130, 143) then Places a orange 100x51 rectangle at position (402, 0) then Places a white circle of radius 50 at center (413, 74).
; PLAN: r0=390(x1), r1=177(y1), r2=130(x2), r3=143(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=402(x), r6=0(y), r7=100(width), r8=51(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=413(x), r11=74(y), r12=50(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 390
LDI r1, 177
LDI r2, 130
LDI r3, 143
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 0
LDI r7, 100
LDI r8, 51
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 413
LDI r11, 74
LDI r12, 50
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
