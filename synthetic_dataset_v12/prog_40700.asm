; DESCRIPTION: Composite: Draws a green line from (42, 132) to (251, 113) then Places a orange dot at position (281, 244) then Draws a purple circle centered at (75, 111) with radius 62.
; PLAN: r0=42(x1), r1=132(y1), r2=251(x2), r3=113(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=281(x), r6=244(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=75(x), r11=111(y), r12=62(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 42
LDI r1, 132
LDI r2, 251
LDI r3, 113
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 244
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 75
LDI r11, 111
LDI r12, 62
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
