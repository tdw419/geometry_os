; DESCRIPTION: Composite: Draws a cyan circle centered at (242, 103) with radius 52 then Draws a orange line from (85, 139) to (508, 203).
; PLAN: r0=242(x), r1=103(y), r2=52(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=85(x1), r6=139(y1), r7=508(x2), r8=203(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 242
LDI r1, 103
LDI r2, 52
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 85
LDI r6, 139
LDI r7, 508
LDI r8, 203
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
