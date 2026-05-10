; DESCRIPTION: Composite: Draws a yellow circle centered at (156, 133) with radius 74 then Places a purple 90x68 rectangle at position (144, 150) then Sets a single yellow pixel at (315, 52).
; PLAN: r0=156(x), r1=133(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=144(x), r6=150(y), r7=90(width), r8=68(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=315(x), r11=52(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 156
LDI r1, 133
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 144
LDI r6, 150
LDI r7, 90
LDI r8, 68
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 315
LDI r11, 52
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
