; DESCRIPTION: Composite: Renders a orange line between points (479, 132) and (42, 245) then Draws a blue circle centered at (359, 94) with radius 12.
; PLAN: r0=479(x1), r1=132(y1), r2=42(x2), r3=245(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=359(x), r6=94(y), r7=12(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 479
LDI r1, 132
LDI r2, 42
LDI r3, 245
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 359
LDI r6, 94
LDI r7, 12
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
