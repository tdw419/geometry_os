; DESCRIPTION: Composite: Draws a magenta line from (226, 117) to (479, 78) then Sets a single cyan pixel at (312, 220) then Creates a green circular shape at (257, 161) with radius 80.
; PLAN: r0=226(x1), r1=117(y1), r2=479(x2), r3=78(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=312(x), r6=220(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=257(x), r11=161(y), r12=80(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 226
LDI r1, 117
LDI r2, 479
LDI r3, 78
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 220
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 257
LDI r11, 161
LDI r12, 80
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
