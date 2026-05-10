; DESCRIPTION: Composite: Renders a black disk with center (350, 100) and radius 24 then Places a black 11x68 rectangle at position (392, 123) then Sets a single blue pixel at (501, 90).
; PLAN: r0=350(x), r1=100(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=392(x), r6=123(y), r7=11(width), r8=68(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=501(x), r11=90(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 350
LDI r1, 100
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 392
LDI r6, 123
LDI r7, 11
LDI r8, 68
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 501
LDI r11, 90
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
