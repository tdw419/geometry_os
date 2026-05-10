; DESCRIPTION: Composite: Renders a yellow box of size 78x89 starting at (4, 128) then Sets a single green pixel at (60, 133) then Places a blue line segment connecting (71, 130) to (483, 5).
; PLAN: r0=4(x), r1=128(y), r2=78(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=60(x), r6=133(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=71(x1), r11=130(y1), r12=483(x2), r13=5(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 4
LDI r1, 128
LDI r2, 78
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 133
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 71
LDI r11, 130
LDI r12, 483
LDI r13, 5
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
