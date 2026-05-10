; DESCRIPTION: Composite: Renders a magenta box of size 111x25 starting at (155, 43) then Renders a orange line between points (173, 114) and (366, 111).
; PLAN: r0=155(x), r1=43(y), r2=111(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=173(x1), r6=114(y1), r7=366(x2), r8=111(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 155
LDI r1, 43
LDI r2, 111
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 173
LDI r6, 114
LDI r7, 366
LDI r8, 111
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
