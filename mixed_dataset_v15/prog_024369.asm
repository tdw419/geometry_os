; DESCRIPTION: Composite: Draws a red line from (50, 191) to (474, 17) then Places a cyan dot at position (379, 235).
; PLAN: r0=50(x1), r1=191(y1), r2=474(x2), r3=17(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=379(x), r6=235(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 50
LDI r1, 191
LDI r2, 474
LDI r3, 17
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 379
LDI r6, 235
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
