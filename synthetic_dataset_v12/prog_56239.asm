; DESCRIPTION: Composite: Sets a single magenta pixel at (23, 45) then Places a magenta 40x110 rectangle at position (470, 36) then Renders a purple disk with center (468, 90) and radius 23.
; PLAN: r0=23(x), r1=45(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=470(x), r6=36(y), r7=40(width), r8=110(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=468(x), r11=90(y), r12=23(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 23
LDI r1, 45
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 470
LDI r6, 36
LDI r7, 40
LDI r8, 110
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 468
LDI r11, 90
LDI r12, 23
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
