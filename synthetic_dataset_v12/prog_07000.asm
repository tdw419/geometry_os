; DESCRIPTION: Composite: Places a cyan dot at position (235, 107) then Renders a green line between points (157, 184) and (484, 19).
; PLAN: r0=235(x), r1=107(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=157(x1), r6=184(y1), r7=484(x2), r8=19(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 235
LDI r1, 107
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 157
LDI r6, 184
LDI r7, 484
LDI r8, 19
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
