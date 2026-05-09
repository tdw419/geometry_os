; DESCRIPTION: Composite: Sets a single white pixel at (298, 206) then Renders a orange line between points (201, 184) and (76, 11).
; PLAN: r0=298(x), r1=206(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=201(x1), r6=184(y1), r7=76(x2), r8=11(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 298
LDI r1, 206
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 201
LDI r6, 184
LDI r7, 76
LDI r8, 11
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
