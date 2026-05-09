; DESCRIPTION: Composite: Draws a purple line from (6, 27) to (385, 243) then Sets a single orange pixel at (71, 32).
; PLAN: r0=6(x1), r1=27(y1), r2=385(x2), r3=243(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=71(x), r6=32(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 6
LDI r1, 27
LDI r2, 385
LDI r3, 243
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 32
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
