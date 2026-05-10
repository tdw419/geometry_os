; DESCRIPTION: Composite: Renders a magenta box of size 113x94 starting at (261, 54) then Draws a purple line from (471, 107) to (67, 192).
; PLAN: r0=261(x), r1=54(y), r2=113(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=471(x1), r6=107(y1), r7=67(x2), r8=192(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 261
LDI r1, 54
LDI r2, 113
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 471
LDI r6, 107
LDI r7, 67
LDI r8, 192
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
