; DESCRIPTION: Composite: Draws a orange circle centered at (433, 210) with radius 13 then Renders a magenta line between points (326, 35) and (45, 50) then Sets a single green pixel at (451, 161).
; PLAN: r0=433(x), r1=210(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=326(x1), r6=35(y1), r7=45(x2), r8=50(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=451(x), r11=161(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 433
LDI r1, 210
LDI r2, 13
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 326
LDI r6, 35
LDI r7, 45
LDI r8, 50
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 451
LDI r11, 161
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
