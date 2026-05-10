; DESCRIPTION: Composite: Places a green 98x78 rectangle at position (400, 48) then Places a white line segment connecting (302, 183) to (409, 97) then Creates a cyan circular shape at (143, 38) with radius 35.
; PLAN: r0=400(x), r1=48(y), r2=98(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=302(x1), r6=183(y1), r7=409(x2), r8=97(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=143(x), r11=38(y), r12=35(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 400
LDI r1, 48
LDI r2, 98
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 302
LDI r6, 183
LDI r7, 409
LDI r8, 97
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 143
LDI r11, 38
LDI r12, 35
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
