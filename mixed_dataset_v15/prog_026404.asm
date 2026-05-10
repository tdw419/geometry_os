; DESCRIPTION: Composite: Creates a cyan rectangular region at (6, 200) spanning 81 by 23 pixels then Draws a black circle centered at (365, 117) with radius 21 then Sets a single blue pixel at (148, 186).
; PLAN: r0=6(x), r1=200(y), r2=81(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=365(x), r6=117(y), r7=21(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=148(x), r11=186(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 6
LDI r1, 200
LDI r2, 81
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 365
LDI r6, 117
LDI r7, 21
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 148
LDI r11, 186
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
