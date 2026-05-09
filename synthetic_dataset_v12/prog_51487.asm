; DESCRIPTION: Composite: Places a magenta 57x97 rectangle at position (97, 63) then Sets a single orange pixel at (89, 4) then Renders a magenta disk with center (57, 65) and radius 25.
; PLAN: r0=97(x), r1=63(y), r2=57(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=89(x), r6=4(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=57(x), r11=65(y), r12=25(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 97
LDI r1, 63
LDI r2, 57
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 89
LDI r6, 4
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 57
LDI r11, 65
LDI r12, 25
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
