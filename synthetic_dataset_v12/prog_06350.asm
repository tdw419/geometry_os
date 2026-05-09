; DESCRIPTION: Composite: Draws a white line from (287, 130) to (370, 97) then Sets a single magenta pixel at (490, 190).
; PLAN: r0=287(x1), r1=130(y1), r2=370(x2), r3=97(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=490(x), r6=190(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 287
LDI r1, 130
LDI r2, 370
LDI r3, 97
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 490
LDI r6, 190
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
