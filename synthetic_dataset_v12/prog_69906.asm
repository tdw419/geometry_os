; DESCRIPTION: Composite: Renders a purple box of size 82x72 starting at (397, 109) then Draws a purple line from (423, 78) to (378, 95).
; PLAN: r0=397(x), r1=109(y), r2=82(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=423(x1), r6=78(y1), r7=378(x2), r8=95(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 397
LDI r1, 109
LDI r2, 82
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 78
LDI r7, 378
LDI r8, 95
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
