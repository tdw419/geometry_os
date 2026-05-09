; DESCRIPTION: Composite: Sets a single green pixel at (376, 244) then Places a cyan line segment connecting (202, 131) to (146, 211).
; PLAN: r0=376(x), r1=244(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=202(x1), r6=131(y1), r7=146(x2), r8=211(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 376
LDI r1, 244
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 202
LDI r6, 131
LDI r7, 146
LDI r8, 211
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
