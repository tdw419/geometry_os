; DESCRIPTION: Composite: Renders a red box of size 27x45 starting at (62, 4) then Places a purple line segment connecting (338, 172) to (358, 77).
; PLAN: r0=62(x), r1=4(y), r2=27(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=338(x1), r6=172(y1), r7=358(x2), r8=77(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 62
LDI r1, 4
LDI r2, 27
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 338
LDI r6, 172
LDI r7, 358
LDI r8, 77
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
