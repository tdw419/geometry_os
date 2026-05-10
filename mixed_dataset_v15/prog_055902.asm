; DESCRIPTION: Composite: Sets a single white pixel at (349, 187) then Places a green line segment connecting (231, 126) to (24, 184).
; PLAN: r0=349(x), r1=187(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=231(x1), r6=126(y1), r7=24(x2), r8=184(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 349
LDI r1, 187
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 231
LDI r6, 126
LDI r7, 24
LDI r8, 184
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
