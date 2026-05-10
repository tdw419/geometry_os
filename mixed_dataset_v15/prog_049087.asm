; DESCRIPTION: Composite: Sets a single green pixel at (199, 66) then Draws a black rectangle at (483, 107) with width 17 and height 58 then Renders a green line between points (257, 98) and (28, 99).
; PLAN: r0=199(x), r1=66(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=483(x), r6=107(y), r7=17(width), r8=58(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=257(x1), r11=98(y1), r12=28(x2), r13=99(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 199
LDI r1, 66
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 483
LDI r6, 107
LDI r7, 17
LDI r8, 58
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 257
LDI r11, 98
LDI r12, 28
LDI r13, 99
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
