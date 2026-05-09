; DESCRIPTION: Composite: . Then Sets a single black pixel at (14, 233). Then Draws a white line from (169, 80) to (79, 169).
; PLAN: r0=14(x), r1=233(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=169(x1), r1=80(y1), r2=79(x2), r3=169(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (14, 233).
; PLAN: r0=14(x), r1=233(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 14
LDI r1, 233
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Draws a white line from (169, 80) to (79, 169).
; PLAN: r0=169(x1), r1=80(y1), r2=79(x2), r3=169(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 80
LDI r2, 79
LDI r3, 169
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
