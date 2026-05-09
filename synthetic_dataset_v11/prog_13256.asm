; DESCRIPTION: Composite: . Then Sets a single white pixel at (228, 159). Then Draws a cyan line from (50, 87) to (37, 61).
; PLAN: r0=228(x), r1=159(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=50(x1), r1=87(y1), r2=37(x2), r3=61(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (228, 159).
; PLAN: r0=228(x), r1=159(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 228
LDI r1, 159
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a cyan line from (50, 87) to (37, 61).
; PLAN: r0=50(x1), r1=87(y1), r2=37(x2), r3=61(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 87
LDI r2, 37
LDI r3, 61
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
