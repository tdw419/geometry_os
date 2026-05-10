; DESCRIPTION: Composite: Places a purple line segment connecting (375, 247) to (276, 138) then Places a black circle of radius 42 at center (60, 201) then Sets a single white pixel at (474, 222).
; PLAN: r0=375(x1), r1=247(y1), r2=276(x2), r3=138(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=60(x), r6=201(y), r7=42(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=474(x), r11=222(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 375
LDI r1, 247
LDI r2, 276
LDI r3, 138
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 201
LDI r7, 42
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 474
LDI r11, 222
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
