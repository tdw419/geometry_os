; DESCRIPTION: Composite: Places a black line segment connecting (2, 69) to (490, 0) then Renders a orange disk with center (143, 164) and radius 36 then Renders a cyan box of size 100x75 starting at (158, 107).
; PLAN: r0=2(x1), r1=69(y1), r2=490(x2), r3=0(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=143(x), r6=164(y), r7=36(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=158(x), r11=107(y), r12=100(width), r13=75(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 2
LDI r1, 69
LDI r2, 490
LDI r3, 0
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 164
LDI r7, 36
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 158
LDI r11, 107
LDI r12, 100
LDI r13, 75
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
