; DESCRIPTION: Composite: Draws a yellow line from (356, 53) to (101, 13) then Draws a blue circle centered at (143, 224) with radius 27 then Sets a single red pixel at (494, 79).
; PLAN: r0=356(x1), r1=53(y1), r2=101(x2), r3=13(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=143(x), r6=224(y), r7=27(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=494(x), r11=79(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 356
LDI r1, 53
LDI r2, 101
LDI r3, 13
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 224
LDI r7, 27
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 494
LDI r11, 79
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
