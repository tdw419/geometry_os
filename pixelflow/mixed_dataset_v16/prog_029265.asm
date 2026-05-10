; DESCRIPTION: Composite: Places a black 37x43 rectangle at position (109, 126) then Places a red line segment connecting (77, 37) to (27, 151) then Places a blue circle of radius 30 at center (97, 34).
; PLAN: r0=109(x), r1=126(y), r2=37(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=77(x1), r6=37(y1), r7=27(x2), r8=151(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=97(x), r11=34(y), r12=30(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 109
LDI r1, 126
LDI r2, 37
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 37
LDI r7, 27
LDI r8, 151
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 97
LDI r11, 34
LDI r12, 30
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
