; DESCRIPTION: Composite: . Then Draws a cyan line from (83, 35) to (186, 76). Then Sets a single black pixel at (235, 60).
; PLAN: r0=83(x1), r1=35(y1), r2=186(x2), r3=76(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=235(x), r1=60(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a cyan line from (83, 35) to (186, 76).
; PLAN: r0=83(x1), r1=35(y1), r2=186(x2), r3=76(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 35
LDI r2, 186
LDI r3, 76
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (235, 60).
; PLAN: r0=235(x), r1=60(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 235
LDI r1, 60
LDI r2, 0x000000
PSET r0, r1, r2
HALT
