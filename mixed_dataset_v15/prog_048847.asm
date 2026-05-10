; DESCRIPTION: Composite: Sets a single purple pixel at (157, 113) then Places a black line segment connecting (508, 114) to (263, 128) then Places a red 119x82 rectangle at position (110, 99).
; PLAN: r0=157(x), r1=113(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=508(x1), r6=114(y1), r7=263(x2), r8=128(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=110(x), r11=99(y), r12=119(width), r13=82(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 157
LDI r1, 113
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 508
LDI r6, 114
LDI r7, 263
LDI r8, 128
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 110
LDI r11, 99
LDI r12, 119
LDI r13, 82
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
