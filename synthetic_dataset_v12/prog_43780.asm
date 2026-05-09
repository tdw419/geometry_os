; DESCRIPTION: Composite: Renders a red box of size 19x101 starting at (252, 100) then Places a cyan line segment connecting (65, 80) to (436, 153).
; PLAN: r0=252(x), r1=100(y), r2=19(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=65(x1), r6=80(y1), r7=436(x2), r8=153(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 252
LDI r1, 100
LDI r2, 19
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 80
LDI r7, 436
LDI r8, 153
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
