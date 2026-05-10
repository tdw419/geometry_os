; DESCRIPTION: Composite: Creates a cyan rectangular region at (43, 116) spanning 54 by 61 pixels then Places a orange line segment connecting (478, 43) to (444, 202) then Places a green dot at position (414, 103).
; PLAN: r0=43(x), r1=116(y), r2=54(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=478(x1), r6=43(y1), r7=444(x2), r8=202(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=414(x), r11=103(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 43
LDI r1, 116
LDI r2, 54
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 478
LDI r6, 43
LDI r7, 444
LDI r8, 202
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 414
LDI r11, 103
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
