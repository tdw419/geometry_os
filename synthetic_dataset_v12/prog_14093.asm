; DESCRIPTION: Composite: Sets a single blue pixel at (159, 53) then Draws a magenta line from (63, 99) to (171, 42) then Places a purple 90x86 rectangle at position (259, 44).
; PLAN: r0=159(x), r1=53(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=63(x1), r6=99(y1), r7=171(x2), r8=42(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=259(x), r11=44(y), r12=90(width), r13=86(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 159
LDI r1, 53
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 63
LDI r6, 99
LDI r7, 171
LDI r8, 42
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 259
LDI r11, 44
LDI r12, 90
LDI r13, 86
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
