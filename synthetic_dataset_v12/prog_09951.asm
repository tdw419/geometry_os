; DESCRIPTION: Composite: Renders a orange box of size 85x56 starting at (192, 182) then Draws a orange line from (472, 154) to (56, 78).
; PLAN: r0=192(x), r1=182(y), r2=85(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=472(x1), r6=154(y1), r7=56(x2), r8=78(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 192
LDI r1, 182
LDI r2, 85
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 472
LDI r6, 154
LDI r7, 56
LDI r8, 78
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
