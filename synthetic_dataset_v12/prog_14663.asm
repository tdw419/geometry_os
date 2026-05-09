; DESCRIPTION: Composite: Draws a cyan rectangle at (257, 42) with width 31 and height 85 then Sets a single orange pixel at (86, 67) then Places a purple line segment connecting (341, 100) to (174, 243).
; PLAN: r0=257(x), r1=42(y), r2=31(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=86(x), r6=67(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=341(x1), r11=100(y1), r12=174(x2), r13=243(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 257
LDI r1, 42
LDI r2, 31
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 67
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 341
LDI r11, 100
LDI r12, 174
LDI r13, 243
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
