; DESCRIPTION: Composite: Draws a black line from (247, 152) to (140, 251) then Creates a magenta circular shape at (140, 110) with radius 52 then Places a red dot at position (82, 4).
; PLAN: r0=247(x1), r1=152(y1), r2=140(x2), r3=251(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=140(x), r6=110(y), r7=52(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=82(x), r11=4(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 247
LDI r1, 152
LDI r2, 140
LDI r3, 251
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 110
LDI r7, 52
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 82
LDI r11, 4
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
