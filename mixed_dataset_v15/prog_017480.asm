; DESCRIPTION: Composite: Places a cyan dot at position (452, 251) then Creates a blue circular shape at (227, 148) with radius 72 then Places a black line segment connecting (489, 161) to (500, 242).
; PLAN: r0=452(x), r1=251(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=227(x), r6=148(y), r7=72(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=489(x1), r11=161(y1), r12=500(x2), r13=242(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 452
LDI r1, 251
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 227
LDI r6, 148
LDI r7, 72
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 489
LDI r11, 161
LDI r12, 500
LDI r13, 242
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
