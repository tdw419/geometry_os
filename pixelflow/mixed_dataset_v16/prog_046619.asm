; DESCRIPTION: Composite: Draws a orange line from (437, 44) to (418, 20) then Renders a black disk with center (86, 75) and radius 16.
; PLAN: r0=437(x1), r1=44(y1), r2=418(x2), r3=20(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=86(x), r6=75(y), r7=16(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 437
LDI r1, 44
LDI r2, 418
LDI r3, 20
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 75
LDI r7, 16
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
