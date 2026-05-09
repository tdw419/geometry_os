; DESCRIPTION: Composite: Draws a black line from (278, 128) to (437, 5) then Sets a single red pixel at (259, 128).
; PLAN: r0=278(x1), r1=128(y1), r2=437(x2), r3=5(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=259(x), r6=128(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 278
LDI r1, 128
LDI r2, 437
LDI r3, 5
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 259
LDI r6, 128
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
