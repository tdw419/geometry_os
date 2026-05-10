; DESCRIPTION: Composite: Draws a cyan circle centered at (323, 89) with radius 14 then Renders a black line between points (203, 77) and (108, 154).
; PLAN: r0=323(x), r1=89(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=203(x1), r6=77(y1), r7=108(x2), r8=154(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 323
LDI r1, 89
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 203
LDI r6, 77
LDI r7, 108
LDI r8, 154
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
