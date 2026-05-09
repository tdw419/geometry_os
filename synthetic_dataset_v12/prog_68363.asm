; DESCRIPTION: Composite: Places a purple dot at position (182, 139) then Renders a purple box of size 83x76 starting at (403, 9) then Places a orange line segment connecting (301, 11) to (158, 96).
; PLAN: r0=182(x), r1=139(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=403(x), r6=9(y), r7=83(width), r8=76(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=301(x1), r11=11(y1), r12=158(x2), r13=96(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 182
LDI r1, 139
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 403
LDI r6, 9
LDI r7, 83
LDI r8, 76
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 301
LDI r11, 11
LDI r12, 158
LDI r13, 96
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
