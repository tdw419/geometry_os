; DESCRIPTION: Composite: Creates a purple circular shape at (138, 166) with radius 64 then Places a orange line segment connecting (356, 50) to (453, 41) then Places a black 112x30 rectangle at position (54, 225).
; PLAN: r0=138(x), r1=166(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=356(x1), r6=50(y1), r7=453(x2), r8=41(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=54(x), r11=225(y), r12=112(width), r13=30(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 138
LDI r1, 166
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 356
LDI r6, 50
LDI r7, 453
LDI r8, 41
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 54
LDI r11, 225
LDI r12, 112
LDI r13, 30
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
