; DESCRIPTION: Composite: Renders a red box of size 118x36 starting at (319, 195) then Places a black line segment connecting (482, 128) to (451, 82) then Places a green circle of radius 48 at center (212, 103).
; PLAN: r0=319(x), r1=195(y), r2=118(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=482(x1), r6=128(y1), r7=451(x2), r8=82(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=212(x), r11=103(y), r12=48(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 319
LDI r1, 195
LDI r2, 118
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 482
LDI r6, 128
LDI r7, 451
LDI r8, 82
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 212
LDI r11, 103
LDI r12, 48
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
