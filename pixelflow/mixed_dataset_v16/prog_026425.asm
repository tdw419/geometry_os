; DESCRIPTION: Composite: Sets a single green pixel at (167, 76) then Renders a cyan line between points (413, 185) and (455, 114).
; PLAN: r0=167(x), r1=76(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=413(x1), r6=185(y1), r7=455(x2), r8=114(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 167
LDI r1, 76
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 413
LDI r6, 185
LDI r7, 455
LDI r8, 114
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
