; DESCRIPTION: Composite: Draws a magenta line from (235, 183) to (349, 225) then Creates a magenta circular shape at (227, 128) with radius 60 then Places a green dot at position (181, 115).
; PLAN: r0=235(x1), r1=183(y1), r2=349(x2), r3=225(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=227(x), r6=128(y), r7=60(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=181(x), r11=115(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 235
LDI r1, 183
LDI r2, 349
LDI r3, 225
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 128
LDI r7, 60
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 181
LDI r11, 115
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
