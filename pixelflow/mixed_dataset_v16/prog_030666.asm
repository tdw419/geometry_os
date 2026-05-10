; DESCRIPTION: Composite: Sets a single blue pixel at (296, 128) then Places a red line segment connecting (42, 128) to (203, 94).
; PLAN: r0=296(x), r1=128(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=42(x1), r6=128(y1), r7=203(x2), r8=94(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 296
LDI r1, 128
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 42
LDI r6, 128
LDI r7, 203
LDI r8, 94
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
