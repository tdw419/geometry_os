; DESCRIPTION: Composite: Places a orange dot at position (305, 195) then Renders a purple line between points (23, 66) and (301, 138) then Creates a blue rectangular region at (411, 83) spanning 18 by 27 pixels.
; PLAN: r0=305(x), r1=195(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=23(x1), r6=66(y1), r7=301(x2), r8=138(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=411(x), r11=83(y), r12=18(width), r13=27(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 305
LDI r1, 195
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 23
LDI r6, 66
LDI r7, 301
LDI r8, 138
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 411
LDI r11, 83
LDI r12, 18
LDI r13, 27
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
