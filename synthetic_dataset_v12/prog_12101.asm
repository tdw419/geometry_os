; DESCRIPTION: Composite: Draws a white line from (180, 34) to (64, 156) then Draws a yellow circle centered at (240, 132) with radius 73 then Sets a single orange pixel at (361, 113).
; PLAN: r0=180(x1), r1=34(y1), r2=64(x2), r3=156(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=240(x), r6=132(y), r7=73(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=361(x), r11=113(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 180
LDI r1, 34
LDI r2, 64
LDI r3, 156
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 132
LDI r7, 73
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 361
LDI r11, 113
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
