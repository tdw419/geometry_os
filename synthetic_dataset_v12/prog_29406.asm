; DESCRIPTION: Composite: Renders a cyan box of size 14x45 starting at (24, 11) then Sets a single purple pixel at (170, 78) then Draws a magenta circle centered at (428, 124) with radius 72.
; PLAN: r0=24(x), r1=11(y), r2=14(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=170(x), r6=78(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=428(x), r11=124(y), r12=72(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 24
LDI r1, 11
LDI r2, 14
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 170
LDI r6, 78
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 428
LDI r11, 124
LDI r12, 72
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
