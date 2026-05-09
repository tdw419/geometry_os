; DESCRIPTION: Composite: Places a cyan 103x54 rectangle at position (400, 11) then Places a purple line segment connecting (332, 29) to (2, 102) then Sets a single green pixel at (494, 158).
; PLAN: r0=400(x), r1=11(y), r2=103(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=332(x1), r6=29(y1), r7=2(x2), r8=102(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=494(x), r11=158(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 400
LDI r1, 11
LDI r2, 103
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 29
LDI r7, 2
LDI r8, 102
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 494
LDI r11, 158
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
