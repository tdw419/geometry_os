; DESCRIPTION: Composite: . Then Places a purple 80x36 rectangle at position (115, 178). Then Sets a single white pixel at (216, 34).
; PLAN: r0=115(x), r1=178(y), r2=80(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=216(x), r1=34(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a purple 80x36 rectangle at position (115, 178).
; PLAN: r0=115(x), r1=178(y), r2=80(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 178
LDI r2, 80
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single white pixel at (216, 34).
; PLAN: r0=216(x), r1=34(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 216
LDI r1, 34
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
