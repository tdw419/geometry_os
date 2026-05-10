; DESCRIPTION: Composite: Places a orange dot at position (152, 85) then Places a orange line segment connecting (457, 6) to (23, 156) then Draws a cyan rectangle at (313, 86) with width 108 and height 92.
; PLAN: r0=152(x), r1=85(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=457(x1), r6=6(y1), r7=23(x2), r8=156(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=313(x), r11=86(y), r12=108(width), r13=92(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 152
LDI r1, 85
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 457
LDI r6, 6
LDI r7, 23
LDI r8, 156
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 313
LDI r11, 86
LDI r12, 108
LDI r13, 92
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
