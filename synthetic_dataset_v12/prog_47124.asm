; DESCRIPTION: Composite: Draws a black line from (419, 64) to (255, 121) then Sets a single blue pixel at (157, 226).
; PLAN: r0=419(x1), r1=64(y1), r2=255(x2), r3=121(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=157(x), r6=226(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 419
LDI r1, 64
LDI r2, 255
LDI r3, 121
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 157
LDI r6, 226
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
