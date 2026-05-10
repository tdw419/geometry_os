; DESCRIPTION: Composite: Draws a black circle centered at (231, 78) with radius 78 then Draws a black line from (192, 184) to (176, 190).
; PLAN: r0=231(x), r1=78(y), r2=78(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=192(x1), r6=184(y1), r7=176(x2), r8=190(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 231
LDI r1, 78
LDI r2, 78
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 192
LDI r6, 184
LDI r7, 176
LDI r8, 190
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
