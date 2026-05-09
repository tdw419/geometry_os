; DESCRIPTION: Composite: Draws a cyan line from (288, 158) to (356, 17) then Sets a single orange pixel at (220, 72).
; PLAN: r0=288(x1), r1=158(y1), r2=356(x2), r3=17(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=220(x), r6=72(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 288
LDI r1, 158
LDI r2, 356
LDI r3, 17
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 220
LDI r6, 72
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
