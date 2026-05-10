; DESCRIPTION: Composite: Renders a white box of size 37x15 starting at (119, 173) then Draws a green line from (355, 129) to (291, 254) then Creates a cyan circular shape at (313, 235) with radius 17.
; PLAN: r0=119(x), r1=173(y), r2=37(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=355(x1), r6=129(y1), r7=291(x2), r8=254(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=313(x), r11=235(y), r12=17(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 119
LDI r1, 173
LDI r2, 37
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 129
LDI r7, 291
LDI r8, 254
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 313
LDI r11, 235
LDI r12, 17
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
