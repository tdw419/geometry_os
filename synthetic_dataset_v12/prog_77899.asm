; DESCRIPTION: Composite: Renders a red line between points (58, 222) and (98, 255) then Renders a red box of size 86x89 starting at (370, 80).
; PLAN: r0=58(x1), r1=222(y1), r2=98(x2), r3=255(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=370(x), r6=80(y), r7=86(width), r8=89(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 58
LDI r1, 222
LDI r2, 98
LDI r3, 255
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 370
LDI r6, 80
LDI r7, 86
LDI r8, 89
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
