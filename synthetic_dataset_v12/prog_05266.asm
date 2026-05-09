; DESCRIPTION: Composite: Creates a white rectangular region at (347, 101) spanning 92 by 108 pixels then Places a green line segment connecting (166, 10) to (365, 71).
; PLAN: r0=347(x), r1=101(y), r2=92(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=166(x1), r6=10(y1), r7=365(x2), r8=71(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 347
LDI r1, 101
LDI r2, 92
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 166
LDI r6, 10
LDI r7, 365
LDI r8, 71
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
