; DESCRIPTION: Composite: Places a black line segment connecting (331, 187) to (340, 147) then Places a green 87x106 rectangle at position (80, 87) then Places a white dot at position (203, 41).
; PLAN: r0=331(x1), r1=187(y1), r2=340(x2), r3=147(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=80(x), r6=87(y), r7=87(width), r8=106(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=203(x), r11=41(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 331
LDI r1, 187
LDI r2, 340
LDI r3, 147
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 80
LDI r6, 87
LDI r7, 87
LDI r8, 106
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 203
LDI r11, 41
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
