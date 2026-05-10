; DESCRIPTION: Composite: Places a green dot at position (358, 249) then Creates a black circular shape at (207, 59) with radius 50 then Places a green line segment connecting (80, 181) to (94, 62).
; PLAN: r0=358(x), r1=249(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=207(x), r6=59(y), r7=50(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=80(x1), r11=181(y1), r12=94(x2), r13=62(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 358
LDI r1, 249
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 207
LDI r6, 59
LDI r7, 50
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 80
LDI r11, 181
LDI r12, 94
LDI r13, 62
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
