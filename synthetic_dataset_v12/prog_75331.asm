; DESCRIPTION: Composite: Sets a single yellow pixel at (249, 179) then Places a cyan line segment connecting (282, 221) to (450, 62).
; PLAN: r0=249(x), r1=179(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=282(x1), r6=221(y1), r7=450(x2), r8=62(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 249
LDI r1, 179
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 282
LDI r6, 221
LDI r7, 450
LDI r8, 62
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
