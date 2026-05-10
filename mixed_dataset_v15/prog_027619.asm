; DESCRIPTION: Composite: Places a orange line segment connecting (132, 151) to (395, 232) then Renders a cyan disk with center (44, 162) and radius 42 then Places a purple dot at position (414, 131).
; PLAN: r0=132(x1), r1=151(y1), r2=395(x2), r3=232(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=44(x), r6=162(y), r7=42(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=414(x), r11=131(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 132
LDI r1, 151
LDI r2, 395
LDI r3, 232
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 44
LDI r6, 162
LDI r7, 42
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 414
LDI r11, 131
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
