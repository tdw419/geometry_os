; DESCRIPTION: Composite: Draws a orange rectangle at (257, 8) with width 43 and height 80 then Places a magenta line segment connecting (439, 93) to (94, 88).
; PLAN: r0=257(x), r1=8(y), r2=43(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=439(x1), r6=93(y1), r7=94(x2), r8=88(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 257
LDI r1, 8
LDI r2, 43
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 93
LDI r7, 94
LDI r8, 88
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
