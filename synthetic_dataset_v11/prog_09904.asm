; DESCRIPTION: Composite: . Then Draws a cyan line from (123, 123) to (190, 120). Then Sets a single red pixel at (156, 177).
; PLAN: r0=123(x1), r1=123(y1), r2=190(x2), r3=120(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=156(x), r1=177(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a cyan line from (123, 123) to (190, 120).
; PLAN: r0=123(x1), r1=123(y1), r2=190(x2), r3=120(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 123
LDI r2, 190
LDI r3, 120
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (156, 177).
; PLAN: r0=156(x), r1=177(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 156
LDI r1, 177
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
