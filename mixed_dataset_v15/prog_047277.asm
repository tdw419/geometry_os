; DESCRIPTION: Composite: Places a black circle of radius 40 at center (421, 117) then Creates a green rectangular region at (10, 39) spanning 40 by 71 pixels then Sets a single black pixel at (60, 4).
; PLAN: r0=421(x), r1=117(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=10(x), r6=39(y), r7=40(width), r8=71(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=60(x), r11=4(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 421
LDI r1, 117
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 10
LDI r6, 39
LDI r7, 40
LDI r8, 71
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 60
LDI r11, 4
LDI r12, 0x000000
PSET r10, r11, r12
HALT
