; DESCRIPTION: Composite: Places a cyan dot at position (259, 39) then Draws a black line from (438, 108) to (381, 228) then Creates a purple circular shape at (210, 202) with radius 17.
; PLAN: r0=259(x), r1=39(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=438(x1), r6=108(y1), r7=381(x2), r8=228(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=210(x), r11=202(y), r12=17(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 259
LDI r1, 39
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 438
LDI r6, 108
LDI r7, 381
LDI r8, 228
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 210
LDI r11, 202
LDI r12, 17
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
