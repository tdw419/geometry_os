; DESCRIPTION: Composite: Draws a red rectangle at (197, 94) with width 43 and height 81 then Renders a yellow line between points (257, 201) and (73, 8) then Sets a single purple pixel at (490, 33).
; PLAN: r0=197(x), r1=94(y), r2=43(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=257(x1), r6=201(y1), r7=73(x2), r8=8(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=490(x), r11=33(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 197
LDI r1, 94
LDI r2, 43
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 201
LDI r7, 73
LDI r8, 8
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 490
LDI r11, 33
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
