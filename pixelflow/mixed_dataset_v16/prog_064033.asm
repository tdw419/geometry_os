; DESCRIPTION: Composite: Creates a magenta rectangular region at (374, 78) spanning 34 by 34 pixels then Places a green line segment connecting (94, 70) to (427, 152).
; PLAN: r0=374(x), r1=78(y), r2=34(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=94(x1), r6=70(y1), r7=427(x2), r8=152(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 374
LDI r1, 78
LDI r2, 34
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 94
LDI r6, 70
LDI r7, 427
LDI r8, 152
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
