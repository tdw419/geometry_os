; DESCRIPTION: Composite: Draws a purple line from (126, 94) to (116, 58) then Places a green 40x89 rectangle at position (324, 74).
; PLAN: r0=126(x1), r1=94(y1), r2=116(x2), r3=58(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=324(x), r6=74(y), r7=40(width), r8=89(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 126
LDI r1, 94
LDI r2, 116
LDI r3, 58
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 74
LDI r7, 40
LDI r8, 89
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
