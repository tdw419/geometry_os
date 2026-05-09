; DESCRIPTION: Composite: Sets a single green pixel at (283, 109) then Places a red line segment connecting (471, 60) to (409, 62).
; PLAN: r0=283(x), r1=109(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=471(x1), r6=60(y1), r7=409(x2), r8=62(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 283
LDI r1, 109
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 471
LDI r6, 60
LDI r7, 409
LDI r8, 62
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
