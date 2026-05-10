; DESCRIPTION: Composite: Places a yellow line segment connecting (17, 54) to (320, 189) then Places a black 110x114 rectangle at position (272, 28) then Sets a single green pixel at (415, 85).
; PLAN: r0=17(x1), r1=54(y1), r2=320(x2), r3=189(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=272(x), r6=28(y), r7=110(width), r8=114(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=415(x), r11=85(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 17
LDI r1, 54
LDI r2, 320
LDI r3, 189
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 28
LDI r7, 110
LDI r8, 114
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 415
LDI r11, 85
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
