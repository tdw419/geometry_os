; DESCRIPTION: Composite: Draws a white line from (193, 14) to (70, 32) then Sets a single white pixel at (196, 147).
; PLAN: r0=193(x1), r1=14(y1), r2=70(x2), r3=32(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=196(x), r6=147(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 193
LDI r1, 14
LDI r2, 70
LDI r3, 32
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 196
LDI r6, 147
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
