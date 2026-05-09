; DESCRIPTION: Composite: Draws a yellow circle centered at (251, 86) with radius 23 then Places a cyan 40x85 rectangle at position (201, 132) then Places a magenta line segment connecting (498, 66) to (262, 108).
; PLAN: r0=251(x), r1=86(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=201(x), r6=132(y), r7=40(width), r8=85(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=498(x1), r11=66(y1), r12=262(x2), r13=108(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 251
LDI r1, 86
LDI r2, 23
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 201
LDI r6, 132
LDI r7, 40
LDI r8, 85
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 498
LDI r11, 66
LDI r12, 262
LDI r13, 108
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
