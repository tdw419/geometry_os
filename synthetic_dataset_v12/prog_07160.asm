; DESCRIPTION: Composite: Places a yellow circle of radius 27 at center (465, 102) then Renders a orange line between points (169, 97) and (351, 215).
; PLAN: r0=465(x), r1=102(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=169(x1), r6=97(y1), r7=351(x2), r8=215(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 465
LDI r1, 102
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 169
LDI r6, 97
LDI r7, 351
LDI r8, 215
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
