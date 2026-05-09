; DESCRIPTION: Composite: Renders a blue box of size 44x77 starting at (149, 151) then Places a white line segment connecting (97, 236) to (191, 224) then Places a green dot at position (93, 37).
; PLAN: r0=149(x), r1=151(y), r2=44(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=97(x1), r6=236(y1), r7=191(x2), r8=224(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=93(x), r11=37(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 149
LDI r1, 151
LDI r2, 44
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 97
LDI r6, 236
LDI r7, 191
LDI r8, 224
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 93
LDI r11, 37
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
