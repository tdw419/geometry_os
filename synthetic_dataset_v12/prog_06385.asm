; DESCRIPTION: Composite: Draws a purple line from (206, 235) to (241, 68) then Renders a red box of size 35x40 starting at (324, 15).
; PLAN: r0=206(x1), r1=235(y1), r2=241(x2), r3=68(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=324(x), r6=15(y), r7=35(width), r8=40(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 206
LDI r1, 235
LDI r2, 241
LDI r3, 68
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 15
LDI r7, 35
LDI r8, 40
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
