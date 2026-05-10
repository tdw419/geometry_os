; DESCRIPTION: Composite: Draws a yellow line from (79, 69) to (502, 26) then Sets a single black pixel at (179, 239).
; PLAN: r0=79(x1), r1=69(y1), r2=502(x2), r3=26(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=179(x), r6=239(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 79
LDI r1, 69
LDI r2, 502
LDI r3, 26
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 179
LDI r6, 239
LDI r7, 0x000000
PSET r5, r6, r7
HALT
