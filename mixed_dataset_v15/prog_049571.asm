; DESCRIPTION: Composite: Draws a blue circle centered at (317, 88) with radius 13 then Places a white line segment connecting (215, 199) to (314, 206) then Places a magenta dot at position (466, 241).
; PLAN: r0=317(x), r1=88(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=215(x1), r6=199(y1), r7=314(x2), r8=206(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=466(x), r11=241(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 317
LDI r1, 88
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 215
LDI r6, 199
LDI r7, 314
LDI r8, 206
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 466
LDI r11, 241
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
