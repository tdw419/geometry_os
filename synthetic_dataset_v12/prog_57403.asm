; DESCRIPTION: Composite: Sets a single purple pixel at (61, 98) then Renders a black line between points (257, 39) and (273, 192) then Draws a black rectangle at (281, 32) with width 52 and height 91.
; PLAN: r0=61(x), r1=98(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=257(x1), r6=39(y1), r7=273(x2), r8=192(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=281(x), r11=32(y), r12=52(width), r13=91(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 61
LDI r1, 98
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 257
LDI r6, 39
LDI r7, 273
LDI r8, 192
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 281
LDI r11, 32
LDI r12, 52
LDI r13, 91
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
