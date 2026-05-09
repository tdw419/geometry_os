; DESCRIPTION: Composite: Places a red line segment connecting (295, 97) to (505, 119) then Renders a red box of size 91x90 starting at (112, 80).
; PLAN: r0=295(x1), r1=97(y1), r2=505(x2), r3=119(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=112(x), r6=80(y), r7=91(width), r8=90(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 295
LDI r1, 97
LDI r2, 505
LDI r3, 119
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 80
LDI r7, 91
LDI r8, 90
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
