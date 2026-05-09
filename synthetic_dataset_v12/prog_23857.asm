; DESCRIPTION: Composite: Draws a cyan rectangle at (167, 57) with width 23 and height 80 then Places a purple circle of radius 44 at center (259, 89) then Places a cyan dot at position (324, 235).
; PLAN: r0=167(x), r1=57(y), r2=23(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=259(x), r6=89(y), r7=44(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=324(x), r11=235(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 167
LDI r1, 57
LDI r2, 23
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 259
LDI r6, 89
LDI r7, 44
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 324
LDI r11, 235
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
