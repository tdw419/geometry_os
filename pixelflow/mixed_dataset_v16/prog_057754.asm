; DESCRIPTION: Composite: Draws a orange rectangle at (89, 71) with width 96 and height 30 then Places a red dot at position (122, 23) then Places a yellow line segment connecting (152, 99) to (103, 6).
; PLAN: r0=89(x), r1=71(y), r2=96(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=122(x), r6=23(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=152(x1), r11=99(y1), r12=103(x2), r13=6(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 89
LDI r1, 71
LDI r2, 96
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 23
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 152
LDI r11, 99
LDI r12, 103
LDI r13, 6
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
