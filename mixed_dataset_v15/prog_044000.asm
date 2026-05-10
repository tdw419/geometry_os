; DESCRIPTION: Composite: Renders a blue box of size 111x83 starting at (394, 86) then Places a white line segment connecting (324, 235) to (370, 167) then Creates a cyan circular shape at (328, 132) with radius 78.
; PLAN: r0=394(x), r1=86(y), r2=111(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=324(x1), r6=235(y1), r7=370(x2), r8=167(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=328(x), r11=132(y), r12=78(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 394
LDI r1, 86
LDI r2, 111
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 235
LDI r7, 370
LDI r8, 167
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 328
LDI r11, 132
LDI r12, 78
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
