; DESCRIPTION: Composite: Places a cyan dot at position (73, 216) then Places a red line segment connecting (422, 199) to (138, 111).
; PLAN: r0=73(x), r1=216(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=422(x1), r6=199(y1), r7=138(x2), r8=111(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 73
LDI r1, 216
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 422
LDI r6, 199
LDI r7, 138
LDI r8, 111
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
