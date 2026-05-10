; DESCRIPTION: Composite: Renders a green box of size 42x23 starting at (118, 89) then Draws a white circle centered at (274, 183) with radius 70 then Renders a white line between points (291, 107) and (273, 214).
; PLAN: r0=118(x), r1=89(y), r2=42(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=274(x), r6=183(y), r7=70(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=291(x1), r11=107(y1), r12=273(x2), r13=214(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 118
LDI r1, 89
LDI r2, 42
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 274
LDI r6, 183
LDI r7, 70
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 291
LDI r11, 107
LDI r12, 273
LDI r13, 214
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
