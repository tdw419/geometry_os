; DESCRIPTION: Composite: Sets a single purple pixel at (99, 244) then Places a red line segment connecting (69, 199) to (371, 235).
; PLAN: r0=99(x), r1=244(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=69(x1), r6=199(y1), r7=371(x2), r8=235(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 99
LDI r1, 244
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 69
LDI r6, 199
LDI r7, 371
LDI r8, 235
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
