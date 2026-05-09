; DESCRIPTION: Composite: Places a yellow line segment connecting (381, 27) to (19, 214) then Creates a yellow circular shape at (194, 105) with radius 60 then Places a cyan dot at position (335, 196).
; PLAN: r0=381(x1), r1=27(y1), r2=19(x2), r3=214(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=194(x), r6=105(y), r7=60(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=335(x), r11=196(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 381
LDI r1, 27
LDI r2, 19
LDI r3, 214
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 105
LDI r7, 60
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 335
LDI r11, 196
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
