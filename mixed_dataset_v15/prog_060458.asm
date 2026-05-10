; DESCRIPTION: Composite: Places a black line segment connecting (233, 177) to (43, 209) then Sets a single magenta pixel at (263, 190).
; PLAN: r0=233(x1), r1=177(y1), r2=43(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=263(x), r6=190(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 233
LDI r1, 177
LDI r2, 43
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 190
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
