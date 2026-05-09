; DESCRIPTION: Composite: Renders a cyan box of size 63x44 starting at (315, 1) then Creates a red circular shape at (118, 90) with radius 77 then Sets a single yellow pixel at (496, 102).
; PLAN: r0=315(x), r1=1(y), r2=63(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=118(x), r6=90(y), r7=77(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=496(x), r11=102(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 315
LDI r1, 1
LDI r2, 63
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 90
LDI r7, 77
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 496
LDI r11, 102
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
