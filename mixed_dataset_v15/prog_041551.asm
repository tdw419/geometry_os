; DESCRIPTION: Composite: Draws a orange line from (294, 174) to (281, 100) then Places a orange dot at position (478, 187) then Draws a orange rectangle at (127, 205) with width 108 and height 30.
; PLAN: r0=294(x1), r1=174(y1), r2=281(x2), r3=100(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=478(x), r6=187(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=127(x), r11=205(y), r12=108(width), r13=30(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 294
LDI r1, 174
LDI r2, 281
LDI r3, 100
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 478
LDI r6, 187
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 127
LDI r11, 205
LDI r12, 108
LDI r13, 30
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
