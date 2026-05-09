; DESCRIPTION: Composite: Places a orange dot at position (56, 82) then Renders a white line between points (511, 145) and (426, 151) then Draws a cyan rectangle at (422, 170) with width 15 and height 45.
; PLAN: r0=56(x), r1=82(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=511(x1), r6=145(y1), r7=426(x2), r8=151(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=422(x), r11=170(y), r12=15(width), r13=45(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 56
LDI r1, 82
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 511
LDI r6, 145
LDI r7, 426
LDI r8, 151
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 422
LDI r11, 170
LDI r12, 15
LDI r13, 45
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
