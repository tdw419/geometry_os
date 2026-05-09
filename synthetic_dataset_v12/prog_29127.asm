; DESCRIPTION: Composite: Places a magenta line segment connecting (243, 175) to (262, 182) then Places a purple dot at position (309, 235).
; PLAN: r0=243(x1), r1=175(y1), r2=262(x2), r3=182(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=309(x), r6=235(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 243
LDI r1, 175
LDI r2, 262
LDI r3, 182
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 309
LDI r6, 235
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
