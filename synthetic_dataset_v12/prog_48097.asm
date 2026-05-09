; DESCRIPTION: Composite: Draws a magenta line from (363, 58) to (181, 244) then Places a cyan circle of radius 43 at center (336, 143) then Places a white dot at position (230, 112).
; PLAN: r0=363(x1), r1=58(y1), r2=181(x2), r3=244(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=336(x), r6=143(y), r7=43(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=230(x), r11=112(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 363
LDI r1, 58
LDI r2, 181
LDI r3, 244
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 143
LDI r7, 43
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 230
LDI r11, 112
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
