; DESCRIPTION: Composite: Renders a cyan box of size 98x106 starting at (163, 20) then Places a black line segment connecting (266, 248) to (339, 15).
; PLAN: r0=163(x), r1=20(y), r2=98(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=266(x1), r6=248(y1), r7=339(x2), r8=15(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 163
LDI r1, 20
LDI r2, 98
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 248
LDI r7, 339
LDI r8, 15
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
