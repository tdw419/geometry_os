; DESCRIPTION: Composite: Renders a purple line between points (194, 57) and (296, 7) then Places a green 52x114 rectangle at position (74, 26).
; PLAN: r0=194(x1), r1=57(y1), r2=296(x2), r3=7(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=74(x), r6=26(y), r7=52(width), r8=114(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 194
LDI r1, 57
LDI r2, 296
LDI r3, 7
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 74
LDI r6, 26
LDI r7, 52
LDI r8, 114
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
