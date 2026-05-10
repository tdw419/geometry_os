; DESCRIPTION: Composite: Places a cyan line segment connecting (79, 191) to (273, 117) then Sets a single magenta pixel at (489, 64) then Draws a yellow circle centered at (303, 86) with radius 33.
; PLAN: r0=79(x1), r1=191(y1), r2=273(x2), r3=117(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=489(x), r6=64(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=303(x), r11=86(y), r12=33(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 79
LDI r1, 191
LDI r2, 273
LDI r3, 117
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 489
LDI r6, 64
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 303
LDI r11, 86
LDI r12, 33
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
