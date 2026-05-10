; DESCRIPTION: Composite: Draws a black line from (313, 141) to (257, 217) then Draws a green circle centered at (239, 82) with radius 77 then Sets a single white pixel at (270, 188).
; PLAN: r0=313(x1), r1=141(y1), r2=257(x2), r3=217(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=239(x), r6=82(y), r7=77(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=270(x), r11=188(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 313
LDI r1, 141
LDI r2, 257
LDI r3, 217
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 239
LDI r6, 82
LDI r7, 77
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 270
LDI r11, 188
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
