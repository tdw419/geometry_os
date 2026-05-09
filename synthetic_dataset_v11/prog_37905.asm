; DESCRIPTION: Composite: . Then Sets a single black pixel at (228, 78). Then Draws a cyan line from (220, 116) to (8, 201).
; PLAN: r0=228(x), r1=78(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=220(x1), r1=116(y1), r2=8(x2), r3=201(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (228, 78).
; PLAN: r0=228(x), r1=78(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 228
LDI r1, 78
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Draws a cyan line from (220, 116) to (8, 201).
; PLAN: r0=220(x1), r1=116(y1), r2=8(x2), r3=201(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 116
LDI r2, 8
LDI r3, 201
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
