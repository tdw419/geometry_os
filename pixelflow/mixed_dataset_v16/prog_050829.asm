; DESCRIPTION: Composite: Draws a magenta line from (498, 31) to (183, 124) then Places a blue circle of radius 33 at center (288, 39) then Sets a single cyan pixel at (438, 71).
; PLAN: r0=498(x1), r1=31(y1), r2=183(x2), r3=124(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=288(x), r6=39(y), r7=33(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=438(x), r11=71(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 498
LDI r1, 31
LDI r2, 183
LDI r3, 124
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 288
LDI r6, 39
LDI r7, 33
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 438
LDI r11, 71
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
