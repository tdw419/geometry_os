; DESCRIPTION: Composite: Creates a cyan rectangular region at (280, 79) spanning 92 by 111 pixels then Draws a green circle centered at (400, 130) with radius 37 then Sets a single purple pixel at (6, 201).
; PLAN: r0=280(x), r1=79(y), r2=92(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=400(x), r6=130(y), r7=37(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=6(x), r11=201(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 280
LDI r1, 79
LDI r2, 92
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 130
LDI r7, 37
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 6
LDI r11, 201
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
