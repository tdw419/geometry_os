; DESCRIPTION: Composite: Creates a cyan rectangular region at (398, 9) spanning 61 by 93 pixels then Places a yellow line segment connecting (184, 175) to (75, 61).
; PLAN: r0=398(x), r1=9(y), r2=61(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=184(x1), r6=175(y1), r7=75(x2), r8=61(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 398
LDI r1, 9
LDI r2, 61
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 175
LDI r7, 75
LDI r8, 61
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
