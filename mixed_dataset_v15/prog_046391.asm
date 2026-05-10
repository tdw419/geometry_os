; DESCRIPTION: Composite: Renders a white box of size 37x54 starting at (259, 51) then Places a orange line segment connecting (66, 64) to (409, 205) then Places a yellow dot at position (272, 94).
; PLAN: r0=259(x), r1=51(y), r2=37(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=66(x1), r6=64(y1), r7=409(x2), r8=205(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=272(x), r11=94(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 259
LDI r1, 51
LDI r2, 37
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 64
LDI r7, 409
LDI r8, 205
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 272
LDI r11, 94
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
