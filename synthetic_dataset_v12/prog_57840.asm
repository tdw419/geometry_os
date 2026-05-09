; DESCRIPTION: Composite: Draws a black line from (22, 30) to (272, 126) then Places a purple dot at position (239, 218).
; PLAN: r0=22(x1), r1=30(y1), r2=272(x2), r3=126(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=239(x), r6=218(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 22
LDI r1, 30
LDI r2, 272
LDI r3, 126
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 239
LDI r6, 218
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
