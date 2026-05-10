; DESCRIPTION: Composite: Draws a black line from (511, 12) to (231, 44) then Sets a single cyan pixel at (115, 56).
; PLAN: r0=511(x1), r1=12(y1), r2=231(x2), r3=44(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=115(x), r6=56(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 511
LDI r1, 12
LDI r2, 231
LDI r3, 44
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 56
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
