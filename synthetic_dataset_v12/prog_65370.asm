; DESCRIPTION: Composite: Places a orange 89x119 rectangle at position (84, 10) then Draws a red line from (134, 128) to (151, 3) then Sets a single white pixel at (193, 86).
; PLAN: r0=84(x), r1=10(y), r2=89(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=134(x1), r6=128(y1), r7=151(x2), r8=3(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=193(x), r11=86(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 84
LDI r1, 10
LDI r2, 89
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 134
LDI r6, 128
LDI r7, 151
LDI r8, 3
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 193
LDI r11, 86
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
