; DESCRIPTION: Composite: Draws a orange circle centered at (360, 63) with radius 20 then Renders a white line between points (442, 228) and (69, 123) then Sets a single magenta pixel at (98, 18).
; PLAN: r0=360(x), r1=63(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=442(x1), r6=228(y1), r7=69(x2), r8=123(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=98(x), r11=18(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 360
LDI r1, 63
LDI r2, 20
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 442
LDI r6, 228
LDI r7, 69
LDI r8, 123
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 98
LDI r11, 18
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
