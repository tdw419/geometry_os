; DESCRIPTION: Composite: Sets a single orange pixel at (82, 121) then Draws a green line from (178, 49) to (290, 129) then Draws a black rectangle at (31, 54) with width 91 and height 28.
; PLAN: r0=82(x), r1=121(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=178(x1), r6=49(y1), r7=290(x2), r8=129(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=31(x), r11=54(y), r12=91(width), r13=28(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 82
LDI r1, 121
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 178
LDI r6, 49
LDI r7, 290
LDI r8, 129
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 31
LDI r11, 54
LDI r12, 91
LDI r13, 28
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
