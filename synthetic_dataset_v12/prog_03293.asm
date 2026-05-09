; DESCRIPTION: Composite: Draws a red line from (50, 235) to (29, 224) then Places a purple dot at position (1, 234).
; PLAN: r0=50(x1), r1=235(y1), r2=29(x2), r3=224(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=1(x), r6=234(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 50
LDI r1, 235
LDI r2, 29
LDI r3, 224
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 1
LDI r6, 234
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
