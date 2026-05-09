; DESCRIPTION: Composite: . Then Sets a single orange pixel at (96, 115). Then Draws a red line from (104, 42) to (235, 202).
; PLAN: r0=96(x), r1=115(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=104(x1), r1=42(y1), r2=235(x2), r3=202(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single orange pixel at (96, 115).
; PLAN: r0=96(x), r1=115(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 96
LDI r1, 115
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Draws a red line from (104, 42) to (235, 202).
; PLAN: r0=104(x1), r1=42(y1), r2=235(x2), r3=202(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 42
LDI r2, 235
LDI r3, 202
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
