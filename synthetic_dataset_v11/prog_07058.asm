; DESCRIPTION: Composite: . Then Sets a single blue pixel at (48, 56). Then Draws a green line from (40, 121) to (93, 126).
; PLAN: r0=48(x), r1=56(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=40(x1), r1=121(y1), r2=93(x2), r3=126(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (48, 56).
; PLAN: r0=48(x), r1=56(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 48
LDI r1, 56
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Draws a green line from (40, 121) to (93, 126).
; PLAN: r0=40(x1), r1=121(y1), r2=93(x2), r3=126(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 121
LDI r2, 93
LDI r3, 126
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
