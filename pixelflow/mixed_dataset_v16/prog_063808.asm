; DESCRIPTION: Composite: Places a blue 40x17 rectangle at position (391, 19) then Places a red line segment connecting (439, 163) to (246, 143) then Places a yellow dot at position (338, 192).
; PLAN: r0=391(x), r1=19(y), r2=40(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=439(x1), r6=163(y1), r7=246(x2), r8=143(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=338(x), r11=192(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 391
LDI r1, 19
LDI r2, 40
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 163
LDI r7, 246
LDI r8, 143
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 338
LDI r11, 192
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
