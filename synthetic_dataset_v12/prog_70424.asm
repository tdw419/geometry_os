; DESCRIPTION: Composite: Renders a purple line between points (293, 244) and (314, 141) then Places a cyan 52x107 rectangle at position (247, 40) then Draws a red circle centered at (195, 46) with radius 11.
; PLAN: r0=293(x1), r1=244(y1), r2=314(x2), r3=141(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=247(x), r6=40(y), r7=52(width), r8=107(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=195(x), r11=46(y), r12=11(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 293
LDI r1, 244
LDI r2, 314
LDI r3, 141
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 40
LDI r7, 52
LDI r8, 107
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 195
LDI r11, 46
LDI r12, 11
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
