; DESCRIPTION: Composite: Draws a black circle centered at (78, 191) with radius 42 then Renders a blue line between points (401, 15) and (210, 233) then Sets a single orange pixel at (434, 188).
; PLAN: r0=78(x), r1=191(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=401(x1), r6=15(y1), r7=210(x2), r8=233(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=434(x), r11=188(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 78
LDI r1, 191
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 401
LDI r6, 15
LDI r7, 210
LDI r8, 233
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 434
LDI r11, 188
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
