; DESCRIPTION: Composite: Renders a orange box of size 77x77 starting at (373, 76) then Places a blue dot at position (496, 14) then Draws a magenta line from (263, 220) to (335, 4).
; PLAN: r0=373(x), r1=76(y), r2=77(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=496(x), r6=14(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=263(x1), r11=220(y1), r12=335(x2), r13=4(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 373
LDI r1, 76
LDI r2, 77
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 496
LDI r6, 14
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 263
LDI r11, 220
LDI r12, 335
LDI r13, 4
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
