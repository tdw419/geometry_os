; DESCRIPTION: Composite: Places a blue line segment connecting (506, 147) to (56, 197) then Renders a cyan box of size 42x18 starting at (61, 126) then Creates a purple circular shape at (96, 122) with radius 40.
; PLAN: r0=506(x1), r1=147(y1), r2=56(x2), r3=197(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=61(x), r6=126(y), r7=42(width), r8=18(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=96(x), r11=122(y), r12=40(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 506
LDI r1, 147
LDI r2, 56
LDI r3, 197
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 61
LDI r6, 126
LDI r7, 42
LDI r8, 18
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 96
LDI r11, 122
LDI r12, 40
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
