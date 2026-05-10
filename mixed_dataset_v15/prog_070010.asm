; DESCRIPTION: Composite: Places a magenta line segment connecting (374, 75) to (353, 94) then Places a black circle of radius 15 at center (293, 50) then Places a yellow 13x85 rectangle at position (467, 12).
; PLAN: r0=374(x1), r1=75(y1), r2=353(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=293(x), r6=50(y), r7=15(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=467(x), r11=12(y), r12=13(width), r13=85(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 374
LDI r1, 75
LDI r2, 353
LDI r3, 94
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 50
LDI r7, 15
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 467
LDI r11, 12
LDI r12, 13
LDI r13, 85
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
