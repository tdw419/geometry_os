; DESCRIPTION: Composite: Places a purple line segment connecting (409, 139) to (91, 82) then Places a blue 12x42 rectangle at position (495, 123) then Sets a single blue pixel at (73, 254).
; PLAN: r0=409(x1), r1=139(y1), r2=91(x2), r3=82(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=495(x), r6=123(y), r7=12(width), r8=42(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=73(x), r11=254(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 409
LDI r1, 139
LDI r2, 91
LDI r3, 82
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 495
LDI r6, 123
LDI r7, 12
LDI r8, 42
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 73
LDI r11, 254
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
