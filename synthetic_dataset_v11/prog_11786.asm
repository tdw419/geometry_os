; DESCRIPTION: Composite: . Then Sets a single black pixel at (47, 33). Then Draws a red line from (251, 245) to (121, 173).
; PLAN: r0=47(x), r1=33(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=251(x1), r1=245(y1), r2=121(x2), r3=173(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (47, 33).
; PLAN: r0=47(x), r1=33(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 47
LDI r1, 33
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Draws a red line from (251, 245) to (121, 173).
; PLAN: r0=251(x1), r1=245(y1), r2=121(x2), r3=173(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 245
LDI r2, 121
LDI r3, 173
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
