; DESCRIPTION: Composite: Draws a orange line from (84, 45) to (228, 46) then Creates a blue circular shape at (215, 89) with radius 42 then Sets a single red pixel at (404, 40).
; PLAN: r0=84(x1), r1=45(y1), r2=228(x2), r3=46(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=215(x), r6=89(y), r7=42(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=404(x), r11=40(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 84
LDI r1, 45
LDI r2, 228
LDI r3, 46
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 215
LDI r6, 89
LDI r7, 42
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 404
LDI r11, 40
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
