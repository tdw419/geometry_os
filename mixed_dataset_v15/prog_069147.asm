; DESCRIPTION: Composite: Places a white line segment connecting (420, 212) to (184, 95) then Renders a orange box of size 35x42 starting at (211, 201) then Sets a single purple pixel at (489, 106).
; PLAN: r0=420(x1), r1=212(y1), r2=184(x2), r3=95(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=211(x), r6=201(y), r7=35(width), r8=42(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=489(x), r11=106(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 420
LDI r1, 212
LDI r2, 184
LDI r3, 95
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 201
LDI r7, 35
LDI r8, 42
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 489
LDI r11, 106
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
