; DESCRIPTION: Composite: Sets a single yellow pixel at (490, 180) then Draws a green circle centered at (193, 121) with radius 74 then Renders a orange line between points (211, 27) and (365, 193).
; PLAN: r0=490(x), r1=180(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=193(x), r6=121(y), r7=74(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=211(x1), r11=27(y1), r12=365(x2), r13=193(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 490
LDI r1, 180
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 193
LDI r6, 121
LDI r7, 74
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 211
LDI r11, 27
LDI r12, 365
LDI r13, 193
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
