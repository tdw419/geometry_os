; DESCRIPTION: Composite: Places a red 11x83 rectangle at position (426, 89) then Places a purple line segment connecting (184, 109) to (26, 62).
; PLAN: r0=426(x), r1=89(y), r2=11(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=184(x1), r6=109(y1), r7=26(x2), r8=62(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 426
LDI r1, 89
LDI r2, 11
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 109
LDI r7, 26
LDI r8, 62
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
