; DESCRIPTION: Composite: Creates a white rectangular region at (307, 20) spanning 97 by 23 pixels then Places a orange line segment connecting (42, 37) to (509, 149) then Sets a single yellow pixel at (357, 66).
; PLAN: r0=307(x), r1=20(y), r2=97(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=42(x1), r6=37(y1), r7=509(x2), r8=149(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=357(x), r11=66(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 307
LDI r1, 20
LDI r2, 97
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 42
LDI r6, 37
LDI r7, 509
LDI r8, 149
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 357
LDI r11, 66
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
