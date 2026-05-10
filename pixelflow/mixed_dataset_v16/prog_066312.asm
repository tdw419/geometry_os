; DESCRIPTION: Composite: Renders a yellow box of size 19x49 starting at (445, 2) then Sets a single orange pixel at (153, 63) then Places a cyan circle of radius 31 at center (469, 124).
; PLAN: r0=445(x), r1=2(y), r2=19(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=153(x), r6=63(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=469(x), r11=124(y), r12=31(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 445
LDI r1, 2
LDI r2, 19
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 153
LDI r6, 63
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 469
LDI r11, 124
LDI r12, 31
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
