; DESCRIPTION: Composite: Draws a cyan line from (24, 253) to (76, 234) then Sets a single blue pixel at (493, 209).
; PLAN: r0=24(x1), r1=253(y1), r2=76(x2), r3=234(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=493(x), r6=209(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 24
LDI r1, 253
LDI r2, 76
LDI r3, 234
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 493
LDI r6, 209
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
