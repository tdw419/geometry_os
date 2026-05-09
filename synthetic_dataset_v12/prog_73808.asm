; DESCRIPTION: Composite: Renders a white box of size 117x30 starting at (363, 136) then Renders a green line between points (311, 67) and (381, 36) then Sets a single purple pixel at (428, 91).
; PLAN: r0=363(x), r1=136(y), r2=117(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=311(x1), r6=67(y1), r7=381(x2), r8=36(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=428(x), r11=91(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 363
LDI r1, 136
LDI r2, 117
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 311
LDI r6, 67
LDI r7, 381
LDI r8, 36
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 428
LDI r11, 91
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
