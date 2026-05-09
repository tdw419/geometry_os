; DESCRIPTION: Composite: . Then Places a red dot at position (83, 60). Then Places a purple 66x52 rectangle at position (47, 190).
; PLAN: r0=83(x), r1=60(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=47(x), r1=190(y), r2=66(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (83, 60).
; PLAN: r0=83(x), r1=60(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 83
LDI r1, 60
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Places a purple 66x52 rectangle at position (47, 190).
; PLAN: r0=47(x), r1=190(y), r2=66(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 190
LDI r2, 66
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
