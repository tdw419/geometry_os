; DESCRIPTION: Composite: Draws a black line from (263, 179) to (201, 99) then Sets a single white pixel at (488, 92).
; PLAN: r0=263(x1), r1=179(y1), r2=201(x2), r3=99(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=488(x), r6=92(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 263
LDI r1, 179
LDI r2, 201
LDI r3, 99
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 488
LDI r6, 92
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
