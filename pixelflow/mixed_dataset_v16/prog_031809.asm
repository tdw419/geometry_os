; DESCRIPTION: Composite: Sets a single purple pixel at (423, 235) then Renders a green line between points (356, 96) and (351, 24).
; PLAN: r0=423(x), r1=235(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=356(x1), r6=96(y1), r7=351(x2), r8=24(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 423
LDI r1, 235
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 356
LDI r6, 96
LDI r7, 351
LDI r8, 24
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
