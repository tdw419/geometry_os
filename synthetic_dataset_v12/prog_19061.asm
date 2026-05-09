; DESCRIPTION: Composite: Draws a yellow line from (146, 185) to (243, 128) then Places a white circle of radius 15 at center (247, 151) then Sets a single orange pixel at (143, 62).
; PLAN: r0=146(x1), r1=185(y1), r2=243(x2), r3=128(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=247(x), r6=151(y), r7=15(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=143(x), r11=62(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 146
LDI r1, 185
LDI r2, 243
LDI r3, 128
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 151
LDI r7, 15
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 143
LDI r11, 62
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
