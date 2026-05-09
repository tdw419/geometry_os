; DESCRIPTION: Composite: Renders a yellow line between points (49, 217) and (15, 78) then Places a black 100x101 rectangle at position (63, 150).
; PLAN: r0=49(x1), r1=217(y1), r2=15(x2), r3=78(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=63(x), r6=150(y), r7=100(width), r8=101(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 49
LDI r1, 217
LDI r2, 15
LDI r3, 78
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 150
LDI r7, 100
LDI r8, 101
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
