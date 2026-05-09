; DESCRIPTION: Composite: Creates a black rectangular region at (326, 25) spanning 75 by 89 pixels then Renders a orange line between points (435, 143) and (493, 114).
; PLAN: r0=326(x), r1=25(y), r2=75(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=435(x1), r6=143(y1), r7=493(x2), r8=114(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 326
LDI r1, 25
LDI r2, 75
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 435
LDI r6, 143
LDI r7, 493
LDI r8, 114
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
