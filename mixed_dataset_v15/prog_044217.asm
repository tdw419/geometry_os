; DESCRIPTION: Composite: Places a green line segment connecting (157, 3) to (339, 87) then Places a red 11x30 rectangle at position (450, 201) then Places a magenta dot at position (116, 132).
; PLAN: r0=157(x1), r1=3(y1), r2=339(x2), r3=87(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=450(x), r6=201(y), r7=11(width), r8=30(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=116(x), r11=132(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 157
LDI r1, 3
LDI r2, 339
LDI r3, 87
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 450
LDI r6, 201
LDI r7, 11
LDI r8, 30
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 116
LDI r11, 132
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
