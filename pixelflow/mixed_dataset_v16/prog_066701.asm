; DESCRIPTION: Composite: Places a orange line segment connecting (241, 191) to (148, 179) then Places a magenta 21x71 rectangle at position (93, 3) then Places a cyan dot at position (86, 18).
; PLAN: r0=241(x1), r1=191(y1), r2=148(x2), r3=179(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=93(x), r6=3(y), r7=21(width), r8=71(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=86(x), r11=18(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 241
LDI r1, 191
LDI r2, 148
LDI r3, 179
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 3
LDI r7, 21
LDI r8, 71
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 86
LDI r11, 18
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
