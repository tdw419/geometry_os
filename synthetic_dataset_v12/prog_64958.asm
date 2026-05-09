; DESCRIPTION: Composite: Sets a single orange pixel at (220, 195) then Draws a green circle centered at (61, 193) with radius 19 then Creates a black rectangular region at (365, 84) spanning 19 by 14 pixels.
; PLAN: r0=220(x), r1=195(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=61(x), r6=193(y), r7=19(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=365(x), r11=84(y), r12=19(width), r13=14(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 220
LDI r1, 195
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 61
LDI r6, 193
LDI r7, 19
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 365
LDI r11, 84
LDI r12, 19
LDI r13, 14
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
