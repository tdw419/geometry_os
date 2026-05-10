; DESCRIPTION: Composite: Places a purple 89x108 rectangle at position (195, 106) then Draws a white circle centered at (111, 154) with radius 80 then Places a purple dot at position (316, 117).
; PLAN: r0=195(x), r1=106(y), r2=89(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=111(x), r6=154(y), r7=80(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=316(x), r11=117(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 195
LDI r1, 106
LDI r2, 89
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 111
LDI r6, 154
LDI r7, 80
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 316
LDI r11, 117
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
