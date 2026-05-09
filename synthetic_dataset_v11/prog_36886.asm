; DESCRIPTION: Composite: . Then Renders a green line between points (42, 5) and (142, 40). Then Sets a single purple pixel at (17, 131).
; PLAN: r0=42(x1), r1=5(y1), r2=142(x2), r3=40(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=17(x), r1=131(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a green line between points (42, 5) and (142, 40).
; PLAN: r0=42(x1), r1=5(y1), r2=142(x2), r3=40(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 5
LDI r2, 142
LDI r3, 40
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single purple pixel at (17, 131).
; PLAN: r0=17(x), r1=131(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 17
LDI r1, 131
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
