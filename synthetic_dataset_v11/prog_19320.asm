; DESCRIPTION: Composite: . Then Draws a red line from (183, 183) to (189, 134). Then Places a red dot at position (93, 21).
; PLAN: r0=183(x1), r1=183(y1), r2=189(x2), r3=134(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=93(x), r1=21(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a red line from (183, 183) to (189, 134).
; PLAN: r0=183(x1), r1=183(y1), r2=189(x2), r3=134(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 183
LDI r2, 189
LDI r3, 134
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (93, 21).
; PLAN: r0=93(x), r1=21(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 93
LDI r1, 21
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
