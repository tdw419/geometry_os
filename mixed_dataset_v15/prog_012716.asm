; DESCRIPTION: Composite: Sets a single blue pixel at (473, 170) then Creates a cyan circular shape at (354, 46) with radius 41 then Renders a orange line between points (287, 86) and (261, 89).
; PLAN: r0=473(x), r1=170(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=354(x), r6=46(y), r7=41(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=287(x1), r11=86(y1), r12=261(x2), r13=89(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 473
LDI r1, 170
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 354
LDI r6, 46
LDI r7, 41
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 287
LDI r11, 86
LDI r12, 261
LDI r13, 89
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
