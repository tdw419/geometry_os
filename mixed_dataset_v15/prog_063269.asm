; DESCRIPTION: Composite: Creates a green rectangular region at (456, 27) spanning 55 by 17 pixels then Renders a red disk with center (193, 92) and radius 72 then Sets a single yellow pixel at (311, 44).
; PLAN: r0=456(x), r1=27(y), r2=55(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=193(x), r6=92(y), r7=72(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=311(x), r11=44(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 456
LDI r1, 27
LDI r2, 55
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 193
LDI r6, 92
LDI r7, 72
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 311
LDI r11, 44
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
