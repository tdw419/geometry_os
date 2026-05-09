; DESCRIPTION: Composite: Sets a single purple pixel at (101, 87) then Renders a red line between points (380, 122) and (474, 132).
; PLAN: r0=101(x), r1=87(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=380(x1), r6=122(y1), r7=474(x2), r8=132(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 101
LDI r1, 87
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 380
LDI r6, 122
LDI r7, 474
LDI r8, 132
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
