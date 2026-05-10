; DESCRIPTION: Composite: Draws a yellow line from (138, 222) to (466, 46) then Sets a single white pixel at (235, 244).
; PLAN: r0=138(x1), r1=222(y1), r2=466(x2), r3=46(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=235(x), r6=244(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 138
LDI r1, 222
LDI r2, 466
LDI r3, 46
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 235
LDI r6, 244
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
