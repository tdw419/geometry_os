; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (56, 32). Then Renders a yellow line between points (179, 246) and (187, 24).
; PLAN: r0=56(x), r1=32(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=179(x1), r1=246(y1), r2=187(x2), r3=24(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (56, 32).
; PLAN: r0=56(x), r1=32(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 56
LDI r1, 32
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a yellow line between points (179, 246) and (187, 24).
; PLAN: r0=179(x1), r1=246(y1), r2=187(x2), r3=24(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 246
LDI r2, 187
LDI r3, 24
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
