; DESCRIPTION: Composite: Places a cyan dot at position (419, 20) then Places a green line segment connecting (446, 176) to (378, 196).
; PLAN: r0=419(x), r1=20(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=446(x1), r6=176(y1), r7=378(x2), r8=196(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 419
LDI r1, 20
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 446
LDI r6, 176
LDI r7, 378
LDI r8, 196
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
