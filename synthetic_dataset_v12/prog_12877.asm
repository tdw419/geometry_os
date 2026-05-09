; DESCRIPTION: Composite: Renders a yellow box of size 94x64 starting at (216, 14) then Renders a orange line between points (64, 99) and (151, 203) then Sets a single orange pixel at (246, 81).
; PLAN: r0=216(x), r1=14(y), r2=94(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=64(x1), r6=99(y1), r7=151(x2), r8=203(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=246(x), r11=81(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 216
LDI r1, 14
LDI r2, 94
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 64
LDI r6, 99
LDI r7, 151
LDI r8, 203
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 246
LDI r11, 81
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
