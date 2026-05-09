; DESCRIPTION: Composite: Places a orange dot at position (304, 202) then Renders a magenta line between points (194, 38) and (383, 142) then Draws a purple rectangle at (224, 159) with width 76 and height 47.
; PLAN: r0=304(x), r1=202(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=194(x1), r6=38(y1), r7=383(x2), r8=142(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=224(x), r11=159(y), r12=76(width), r13=47(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 304
LDI r1, 202
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 194
LDI r6, 38
LDI r7, 383
LDI r8, 142
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 224
LDI r11, 159
LDI r12, 76
LDI r13, 47
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
