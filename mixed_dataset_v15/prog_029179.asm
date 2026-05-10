; DESCRIPTION: Composite: Sets a single blue pixel at (394, 108) then Draws a green line from (42, 87) to (199, 232).
; PLAN: r0=394(x), r1=108(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=42(x1), r6=87(y1), r7=199(x2), r8=232(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 394
LDI r1, 108
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 42
LDI r6, 87
LDI r7, 199
LDI r8, 232
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
