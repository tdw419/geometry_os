; DESCRIPTION: Composite: Creates a yellow rectangular region at (184, 88) spanning 29 by 47 pixels then Places a yellow dot at position (165, 187) then Places a cyan line segment connecting (30, 52) to (290, 147).
; PLAN: r0=184(x), r1=88(y), r2=29(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=165(x), r6=187(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=30(x1), r11=52(y1), r12=290(x2), r13=147(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 184
LDI r1, 88
LDI r2, 29
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 165
LDI r6, 187
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 30
LDI r11, 52
LDI r12, 290
LDI r13, 147
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
