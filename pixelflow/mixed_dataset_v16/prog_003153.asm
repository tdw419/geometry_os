; DESCRIPTION: Composite: Renders a white line between points (340, 245) and (216, 33) then Places a white dot at position (313, 68) then Draws a yellow rectangle at (123, 104) with width 57 and height 41.
; PLAN: r0=340(x1), r1=245(y1), r2=216(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=313(x), r6=68(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=123(x), r11=104(y), r12=57(width), r13=41(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 340
LDI r1, 245
LDI r2, 216
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 68
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 123
LDI r11, 104
LDI r12, 57
LDI r13, 41
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
