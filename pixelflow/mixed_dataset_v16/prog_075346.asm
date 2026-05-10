; DESCRIPTION: Composite: Places a orange dot at position (379, 86) then Draws a green line from (355, 81) to (417, 67) then Creates a black circular shape at (329, 139) with radius 80.
; PLAN: r0=379(x), r1=86(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=355(x1), r6=81(y1), r7=417(x2), r8=67(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=329(x), r11=139(y), r12=80(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 379
LDI r1, 86
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 355
LDI r6, 81
LDI r7, 417
LDI r8, 67
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 329
LDI r11, 139
LDI r12, 80
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
