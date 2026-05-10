; DESCRIPTION: Composite: Places a yellow line segment connecting (219, 191) to (385, 247) then Places a yellow dot at position (275, 160) then Renders a magenta box of size 105x103 starting at (99, 9).
; PLAN: r0=219(x1), r1=191(y1), r2=385(x2), r3=247(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=275(x), r6=160(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=99(x), r11=9(y), r12=105(width), r13=103(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 219
LDI r1, 191
LDI r2, 385
LDI r3, 247
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 160
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 99
LDI r11, 9
LDI r12, 105
LDI r13, 103
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
