; DESCRIPTION: Composite: Places a green line segment connecting (265, 28) to (313, 252) then Places a yellow 91x89 rectangle at position (255, 36) then Sets a single yellow pixel at (492, 160).
; PLAN: r0=265(x1), r1=28(y1), r2=313(x2), r3=252(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=255(x), r6=36(y), r7=91(width), r8=89(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=492(x), r11=160(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 265
LDI r1, 28
LDI r2, 313
LDI r3, 252
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 255
LDI r6, 36
LDI r7, 91
LDI r8, 89
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 492
LDI r11, 160
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
