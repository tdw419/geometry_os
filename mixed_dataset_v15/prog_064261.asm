; DESCRIPTION: Composite: Draws a black line from (343, 220) to (298, 86) then Sets a single blue pixel at (480, 200).
; PLAN: r0=343(x1), r1=220(y1), r2=298(x2), r3=86(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=480(x), r6=200(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 343
LDI r1, 220
LDI r2, 298
LDI r3, 86
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 480
LDI r6, 200
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
