; DESCRIPTION: Composite: Places a black line segment connecting (398, 25) to (437, 174) then Creates a black circular shape at (410, 83) with radius 78.
; PLAN: r0=398(x1), r1=25(y1), r2=437(x2), r3=174(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=410(x), r6=83(y), r7=78(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 398
LDI r1, 25
LDI r2, 437
LDI r3, 174
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 83
LDI r7, 78
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
