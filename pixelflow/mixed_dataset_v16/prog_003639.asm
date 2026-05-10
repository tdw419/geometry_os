; DESCRIPTION: Composite: Renders a white line between points (361, 6) and (94, 19) then Sets a single purple pixel at (163, 51) then Creates a cyan rectangular region at (396, 56) spanning 21 by 63 pixels.
; PLAN: r0=361(x1), r1=6(y1), r2=94(x2), r3=19(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=163(x), r6=51(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=396(x), r11=56(y), r12=21(width), r13=63(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 361
LDI r1, 6
LDI r2, 94
LDI r3, 19
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 163
LDI r6, 51
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 396
LDI r11, 56
LDI r12, 21
LDI r13, 63
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
