; DESCRIPTION: Composite: Renders a red box of size 115x34 starting at (374, 101) then Places a purple line segment connecting (4, 19) to (432, 108).
; PLAN: r0=374(x), r1=101(y), r2=115(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=4(x1), r6=19(y1), r7=432(x2), r8=108(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 374
LDI r1, 101
LDI r2, 115
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 4
LDI r6, 19
LDI r7, 432
LDI r8, 108
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
