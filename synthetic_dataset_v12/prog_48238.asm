; DESCRIPTION: Composite: Draws a magenta line from (117, 17) to (505, 184) then Sets a single purple pixel at (107, 240) then Places a cyan 85x29 rectangle at position (254, 130).
; PLAN: r0=117(x1), r1=17(y1), r2=505(x2), r3=184(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=107(x), r6=240(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=254(x), r11=130(y), r12=85(width), r13=29(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 117
LDI r1, 17
LDI r2, 505
LDI r3, 184
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 107
LDI r6, 240
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 254
LDI r11, 130
LDI r12, 85
LDI r13, 29
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
