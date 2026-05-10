; DESCRIPTION: Composite: Draws a orange line from (426, 240) to (107, 42) then Places a cyan dot at position (168, 190) then Draws a orange circle centered at (462, 159) with radius 35.
; PLAN: r0=426(x1), r1=240(y1), r2=107(x2), r3=42(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=168(x), r6=190(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=462(x), r11=159(y), r12=35(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 426
LDI r1, 240
LDI r2, 107
LDI r3, 42
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 190
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 462
LDI r11, 159
LDI r12, 35
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
