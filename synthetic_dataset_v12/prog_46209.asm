; DESCRIPTION: Composite: Sets a single yellow pixel at (274, 245) then Creates a cyan rectangular region at (130, 9) spanning 23 by 56 pixels then Places a black line segment connecting (282, 67) to (449, 162).
; PLAN: r0=274(x), r1=245(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=130(x), r6=9(y), r7=23(width), r8=56(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=282(x1), r11=67(y1), r12=449(x2), r13=162(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 274
LDI r1, 245
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 130
LDI r6, 9
LDI r7, 23
LDI r8, 56
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 282
LDI r11, 67
LDI r12, 449
LDI r13, 162
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
