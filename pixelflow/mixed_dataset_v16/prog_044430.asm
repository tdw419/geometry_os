; DESCRIPTION: Composite: Draws a black line from (308, 21) to (511, 206) then Sets a single green pixel at (270, 42).
; PLAN: r0=308(x1), r1=21(y1), r2=511(x2), r3=206(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=270(x), r6=42(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 308
LDI r1, 21
LDI r2, 511
LDI r3, 206
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 42
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
