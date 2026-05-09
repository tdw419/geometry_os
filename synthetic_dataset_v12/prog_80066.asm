; DESCRIPTION: Composite: Renders a magenta line between points (6, 157) and (196, 46) then Creates a white rectangular region at (279, 122) spanning 19 by 30 pixels then Places a orange circle of radius 23 at center (262, 45).
; PLAN: r0=6(x1), r1=157(y1), r2=196(x2), r3=46(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=279(x), r6=122(y), r7=19(width), r8=30(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=262(x), r11=45(y), r12=23(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 6
LDI r1, 157
LDI r2, 196
LDI r3, 46
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 279
LDI r6, 122
LDI r7, 19
LDI r8, 30
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 262
LDI r11, 45
LDI r12, 23
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
