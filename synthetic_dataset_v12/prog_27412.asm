; DESCRIPTION: Composite: Places a purple line segment connecting (382, 128) to (93, 80) then Draws a red circle centered at (165, 73) with radius 63 then Places a black dot at position (285, 144).
; PLAN: r0=382(x1), r1=128(y1), r2=93(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=165(x), r6=73(y), r7=63(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=285(x), r11=144(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 382
LDI r1, 128
LDI r2, 93
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 165
LDI r6, 73
LDI r7, 63
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 285
LDI r11, 144
LDI r12, 0x000000
PSET r10, r11, r12
HALT
