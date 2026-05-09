; DESCRIPTION: Composite: Places a white line segment connecting (344, 4) to (27, 85) then Places a cyan 18x25 rectangle at position (139, 170) then Sets a single green pixel at (130, 114).
; PLAN: r0=344(x1), r1=4(y1), r2=27(x2), r3=85(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=139(x), r6=170(y), r7=18(width), r8=25(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=130(x), r11=114(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 344
LDI r1, 4
LDI r2, 27
LDI r3, 85
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 139
LDI r6, 170
LDI r7, 18
LDI r8, 25
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 130
LDI r11, 114
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
