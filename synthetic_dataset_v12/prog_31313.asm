; DESCRIPTION: Composite: Places a orange dot at position (62, 229) then Renders a black line between points (115, 222) and (56, 15) then Places a red 39x29 rectangle at position (104, 100).
; PLAN: r0=62(x), r1=229(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=115(x1), r6=222(y1), r7=56(x2), r8=15(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=104(x), r11=100(y), r12=39(width), r13=29(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 62
LDI r1, 229
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 115
LDI r6, 222
LDI r7, 56
LDI r8, 15
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 104
LDI r11, 100
LDI r12, 39
LDI r13, 29
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
