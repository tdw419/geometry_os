; DESCRIPTION: Composite: . Then Draws a red line from (241, 28) to (91, 146). Then Sets a single black pixel at (77, 60).
; PLAN: r0=241(x1), r1=28(y1), r2=91(x2), r3=146(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=77(x), r1=60(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a red line from (241, 28) to (91, 146).
; PLAN: r0=241(x1), r1=28(y1), r2=91(x2), r3=146(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 28
LDI r2, 91
LDI r3, 146
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (77, 60).
; PLAN: r0=77(x), r1=60(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 77
LDI r1, 60
LDI r2, 0x000000
PSET r0, r1, r2
HALT
