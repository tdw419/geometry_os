; DESCRIPTION: Composite: Places a magenta 57x90 rectangle at position (165, 90) then Places a purple dot at position (187, 150) then Places a orange line segment connecting (414, 72) to (506, 247).
; PLAN: r0=165(x), r1=90(y), r2=57(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=187(x), r6=150(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=414(x1), r11=72(y1), r12=506(x2), r13=247(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 165
LDI r1, 90
LDI r2, 57
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 187
LDI r6, 150
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 414
LDI r11, 72
LDI r12, 506
LDI r13, 247
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
