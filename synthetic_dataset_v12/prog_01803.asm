; DESCRIPTION: Composite: Places a orange dot at position (491, 129) then Places a black 108x104 rectangle at position (395, 124) then Renders a yellow line between points (138, 208) and (9, 148).
; PLAN: r0=491(x), r1=129(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=395(x), r6=124(y), r7=108(width), r8=104(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=138(x1), r11=208(y1), r12=9(x2), r13=148(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 491
LDI r1, 129
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 395
LDI r6, 124
LDI r7, 108
LDI r8, 104
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 138
LDI r11, 208
LDI r12, 9
LDI r13, 148
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
