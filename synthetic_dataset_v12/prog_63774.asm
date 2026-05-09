; DESCRIPTION: Composite: Places a green 117x93 rectangle at position (232, 136) then Places a purple line segment connecting (126, 107) to (79, 251).
; PLAN: r0=232(x), r1=136(y), r2=117(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=126(x1), r6=107(y1), r7=79(x2), r8=251(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 232
LDI r1, 136
LDI r2, 117
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 107
LDI r7, 79
LDI r8, 251
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
