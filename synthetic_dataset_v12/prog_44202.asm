; DESCRIPTION: Composite: Draws a black line from (134, 131) to (371, 0) then Sets a single white pixel at (502, 251).
; PLAN: r0=134(x1), r1=131(y1), r2=371(x2), r3=0(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=502(x), r6=251(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 134
LDI r1, 131
LDI r2, 371
LDI r3, 0
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 502
LDI r6, 251
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
