; DESCRIPTION: Composite: Places a green 118x72 rectangle at position (12, 19) then Places a orange line segment connecting (454, 64) to (383, 189) then Sets a single cyan pixel at (493, 166).
; PLAN: r0=12(x), r1=19(y), r2=118(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=454(x1), r6=64(y1), r7=383(x2), r8=189(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=493(x), r11=166(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 12
LDI r1, 19
LDI r2, 118
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 454
LDI r6, 64
LDI r7, 383
LDI r8, 189
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 493
LDI r11, 166
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
