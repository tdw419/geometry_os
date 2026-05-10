; DESCRIPTION: Composite: Renders a black line between points (320, 97) and (384, 51) then Sets a single purple pixel at (10, 126).
; PLAN: r0=320(x1), r1=97(y1), r2=384(x2), r3=51(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=10(x), r6=126(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 320
LDI r1, 97
LDI r2, 384
LDI r3, 51
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 10
LDI r6, 126
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
