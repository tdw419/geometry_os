; DESCRIPTION: Composite: Places a orange line segment connecting (179, 29) to (161, 92) then Sets a single green pixel at (434, 21).
; PLAN: r0=179(x1), r1=29(y1), r2=161(x2), r3=92(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=434(x), r6=21(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 179
LDI r1, 29
LDI r2, 161
LDI r3, 92
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 434
LDI r6, 21
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
