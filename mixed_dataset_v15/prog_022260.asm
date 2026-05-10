; DESCRIPTION: Composite: Places a cyan line segment connecting (271, 92) to (89, 85) then Creates a green rectangular region at (197, 92) spanning 105 by 15 pixels.
; PLAN: r0=271(x1), r1=92(y1), r2=89(x2), r3=85(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=197(x), r6=92(y), r7=105(width), r8=15(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 271
LDI r1, 92
LDI r2, 89
LDI r3, 85
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 197
LDI r6, 92
LDI r7, 105
LDI r8, 15
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
