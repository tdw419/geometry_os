; DESCRIPTION: Composite: Renders a white box of size 29x98 starting at (177, 49) then Places a black line segment connecting (300, 203) to (12, 15) then Places a white dot at position (319, 213).
; PLAN: r0=177(x), r1=49(y), r2=29(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=300(x1), r6=203(y1), r7=12(x2), r8=15(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=319(x), r11=213(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 177
LDI r1, 49
LDI r2, 29
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 203
LDI r7, 12
LDI r8, 15
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 319
LDI r11, 213
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
