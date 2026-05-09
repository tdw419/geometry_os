; DESCRIPTION: Composite: Draws a purple line from (144, 139) to (51, 66) then Places a orange 50x89 rectangle at position (350, 128).
; PLAN: r0=144(x1), r1=139(y1), r2=51(x2), r3=66(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=350(x), r6=128(y), r7=50(width), r8=89(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 144
LDI r1, 139
LDI r2, 51
LDI r3, 66
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 128
LDI r7, 50
LDI r8, 89
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
