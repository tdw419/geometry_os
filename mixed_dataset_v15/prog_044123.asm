; DESCRIPTION: Composite: Creates a white rectangular region at (280, 124) spanning 102 by 64 pixels then Sets a single green pixel at (319, 78) then Draws a cyan circle centered at (233, 93) with radius 63.
; PLAN: r0=280(x), r1=124(y), r2=102(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=319(x), r6=78(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=233(x), r11=93(y), r12=63(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 280
LDI r1, 124
LDI r2, 102
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 78
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 233
LDI r11, 93
LDI r12, 63
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
