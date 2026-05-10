; DESCRIPTION: Composite: Draws a cyan circle centered at (87, 59) with radius 49 then Draws a black line from (231, 147) to (41, 189).
; PLAN: r0=87(x), r1=59(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=231(x1), r6=147(y1), r7=41(x2), r8=189(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 87
LDI r1, 59
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 231
LDI r6, 147
LDI r7, 41
LDI r8, 189
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
