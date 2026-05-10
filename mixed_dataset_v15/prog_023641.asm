; DESCRIPTION: Composite: Renders a purple box of size 105x36 starting at (209, 38) then Places a red line segment connecting (136, 83) to (449, 232).
; PLAN: r0=209(x), r1=38(y), r2=105(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=136(x1), r6=83(y1), r7=449(x2), r8=232(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 209
LDI r1, 38
LDI r2, 105
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 136
LDI r6, 83
LDI r7, 449
LDI r8, 232
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
