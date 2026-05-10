; DESCRIPTION: Composite: Draws a red rectangle at (459, 204) with width 50 and height 36 then Draws a purple line from (131, 4) to (27, 194).
; PLAN: r0=459(x), r1=204(y), r2=50(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=131(x1), r6=4(y1), r7=27(x2), r8=194(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 459
LDI r1, 204
LDI r2, 50
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 131
LDI r6, 4
LDI r7, 27
LDI r8, 194
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
