; DESCRIPTION: Composite: . Then Sets a single red pixel at (218, 212). Then Renders a green line between points (158, 43) and (156, 180).
; PLAN: r0=218(x), r1=212(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=158(x1), r1=43(y1), r2=156(x2), r3=180(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single red pixel at (218, 212).
; PLAN: r0=218(x), r1=212(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 218
LDI r1, 212
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Renders a green line between points (158, 43) and (156, 180).
; PLAN: r0=158(x1), r1=43(y1), r2=156(x2), r3=180(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 43
LDI r2, 156
LDI r3, 180
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
