; DESCRIPTION: Composite: Draws a magenta line from (46, 113) to (235, 32) then Draws a black circle centered at (385, 96) with radius 75.
; PLAN: r0=46(x1), r1=113(y1), r2=235(x2), r3=32(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=385(x), r6=96(y), r7=75(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 46
LDI r1, 113
LDI r2, 235
LDI r3, 32
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 385
LDI r6, 96
LDI r7, 75
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
