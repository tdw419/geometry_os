; DESCRIPTION: Composite: . Then Sets a single white pixel at (251, 86). Then Draws a yellow line from (211, 185) to (250, 120).
; PLAN: r0=251(x), r1=86(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=211(x1), r1=185(y1), r2=250(x2), r3=120(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (251, 86).
; PLAN: r0=251(x), r1=86(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 251
LDI r1, 86
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a yellow line from (211, 185) to (250, 120).
; PLAN: r0=211(x1), r1=185(y1), r2=250(x2), r3=120(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 185
LDI r2, 250
LDI r3, 120
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
