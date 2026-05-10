; DESCRIPTION: Composite: Sets a single green pixel at (458, 10) then Places a green line segment connecting (442, 103) to (419, 219).
; PLAN: r0=458(x), r1=10(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=442(x1), r6=103(y1), r7=419(x2), r8=219(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 458
LDI r1, 10
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 442
LDI r6, 103
LDI r7, 419
LDI r8, 219
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
