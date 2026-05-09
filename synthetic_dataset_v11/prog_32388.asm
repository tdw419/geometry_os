; DESCRIPTION: Composite: . Then Sets a single green pixel at (111, 186). Then Draws a red line from (19, 70) to (116, 27).
; PLAN: r0=111(x), r1=186(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=19(x1), r1=70(y1), r2=116(x2), r3=27(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (111, 186).
; PLAN: r0=111(x), r1=186(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 111
LDI r1, 186
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Draws a red line from (19, 70) to (116, 27).
; PLAN: r0=19(x1), r1=70(y1), r2=116(x2), r3=27(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 70
LDI r2, 116
LDI r3, 27
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
