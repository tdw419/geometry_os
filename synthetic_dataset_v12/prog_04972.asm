; DESCRIPTION: Composite: Places a blue dot at position (416, 178) then Places a orange line segment connecting (223, 138) to (225, 47) then Creates a orange rectangular region at (45, 63) spanning 87 by 90 pixels.
; PLAN: r0=416(x), r1=178(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=223(x1), r6=138(y1), r7=225(x2), r8=47(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=45(x), r11=63(y), r12=87(width), r13=90(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 416
LDI r1, 178
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 223
LDI r6, 138
LDI r7, 225
LDI r8, 47
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 45
LDI r11, 63
LDI r12, 87
LDI r13, 90
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
