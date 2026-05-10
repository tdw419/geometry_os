; DESCRIPTION: Composite: Places a black line segment connecting (317, 9) to (412, 134) then Places a green dot at position (193, 113) then Creates a orange rectangular region at (251, 54) spanning 54 by 62 pixels.
; PLAN: r0=317(x1), r1=9(y1), r2=412(x2), r3=134(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=193(x), r6=113(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=251(x), r11=54(y), r12=54(width), r13=62(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 317
LDI r1, 9
LDI r2, 412
LDI r3, 134
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 193
LDI r6, 113
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 251
LDI r11, 54
LDI r12, 54
LDI r13, 62
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
