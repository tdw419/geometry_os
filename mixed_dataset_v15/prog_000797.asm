; DESCRIPTION: Composite: Renders a white box of size 23x65 starting at (405, 191) then Sets a single magenta pixel at (413, 91) then Draws a orange circle centered at (290, 63) with radius 52.
; PLAN: r0=405(x), r1=191(y), r2=23(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=413(x), r6=91(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=290(x), r11=63(y), r12=52(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 405
LDI r1, 191
LDI r2, 23
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 91
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 290
LDI r11, 63
LDI r12, 52
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
