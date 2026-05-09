; DESCRIPTION: Composite: . Then Sets a single black pixel at (172, 0). Then Draws a white line from (174, 138) to (105, 77).
; PLAN: r0=172(x), r1=0(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=174(x1), r1=138(y1), r2=105(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (172, 0).
; PLAN: r0=172(x), r1=0(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 172
LDI r1, 0
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Draws a white line from (174, 138) to (105, 77).
; PLAN: r0=174(x1), r1=138(y1), r2=105(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 138
LDI r2, 105
LDI r3, 77
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
