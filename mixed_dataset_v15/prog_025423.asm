; DESCRIPTION: Composite: Renders a orange line between points (114, 45) and (429, 57) then Places a purple dot at position (355, 172) then Places a magenta 80x70 rectangle at position (130, 59).
; PLAN: r0=114(x1), r1=45(y1), r2=429(x2), r3=57(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=355(x), r6=172(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=130(x), r11=59(y), r12=80(width), r13=70(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 114
LDI r1, 45
LDI r2, 429
LDI r3, 57
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 172
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 130
LDI r11, 59
LDI r12, 80
LDI r13, 70
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
