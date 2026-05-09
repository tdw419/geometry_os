; DESCRIPTION: Composite: Draws a black line from (496, 199) to (485, 42) then Sets a single purple pixel at (196, 193).
; PLAN: r0=496(x1), r1=199(y1), r2=485(x2), r3=42(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=196(x), r6=193(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 496
LDI r1, 199
LDI r2, 485
LDI r3, 42
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 196
LDI r6, 193
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
