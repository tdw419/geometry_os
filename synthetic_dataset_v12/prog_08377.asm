; DESCRIPTION: Composite: Places a cyan line segment connecting (139, 241) to (450, 22) then Renders a red box of size 52x34 starting at (322, 25).
; PLAN: r0=139(x1), r1=241(y1), r2=450(x2), r3=22(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=322(x), r6=25(y), r7=52(width), r8=34(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 139
LDI r1, 241
LDI r2, 450
LDI r3, 22
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 322
LDI r6, 25
LDI r7, 52
LDI r8, 34
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
