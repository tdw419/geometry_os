; DESCRIPTION: Composite: Places a orange 83x28 rectangle at position (387, 114) then Renders a purple line between points (375, 87) and (52, 183) then Places a white circle of radius 62 at center (326, 119).
; PLAN: r0=387(x), r1=114(y), r2=83(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=375(x1), r6=87(y1), r7=52(x2), r8=183(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=326(x), r11=119(y), r12=62(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 387
LDI r1, 114
LDI r2, 83
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 375
LDI r6, 87
LDI r7, 52
LDI r8, 183
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 326
LDI r11, 119
LDI r12, 62
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
