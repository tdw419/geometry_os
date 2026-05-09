; DESCRIPTION: Composite: . Then Sets a single white pixel at (52, 211). Then Draws a black line from (66, 2) to (202, 172).
; PLAN: r0=52(x), r1=211(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=66(x1), r1=2(y1), r2=202(x2), r3=172(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (52, 211).
; PLAN: r0=52(x), r1=211(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 52
LDI r1, 211
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a black line from (66, 2) to (202, 172).
; PLAN: r0=66(x1), r1=2(y1), r2=202(x2), r3=172(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 2
LDI r2, 202
LDI r3, 172
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
