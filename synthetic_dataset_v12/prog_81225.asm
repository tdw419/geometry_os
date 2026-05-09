; DESCRIPTION: Composite: Places a green line segment connecting (9, 180) to (413, 62) then Places a cyan dot at position (57, 140).
; PLAN: r0=9(x1), r1=180(y1), r2=413(x2), r3=62(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=57(x), r6=140(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 9
LDI r1, 180
LDI r2, 413
LDI r3, 62
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 57
LDI r6, 140
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
