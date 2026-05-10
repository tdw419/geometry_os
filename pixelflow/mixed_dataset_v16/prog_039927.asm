; DESCRIPTION: Composite: Renders a black box of size 58x31 starting at (383, 107) then Renders a orange line between points (443, 248) and (260, 151).
; PLAN: r0=383(x), r1=107(y), r2=58(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=443(x1), r6=248(y1), r7=260(x2), r8=151(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 383
LDI r1, 107
LDI r2, 58
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 443
LDI r6, 248
LDI r7, 260
LDI r8, 151
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
