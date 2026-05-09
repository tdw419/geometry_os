; DESCRIPTION: Composite: . Then Places a purple 114x77 rectangle at position (18, 171). Then Sets a single black pixel at (162, 241).
; PLAN: r0=18(x), r1=171(y), r2=114(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=162(x), r1=241(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a purple 114x77 rectangle at position (18, 171).
; PLAN: r0=18(x), r1=171(y), r2=114(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 171
LDI r2, 114
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (162, 241).
; PLAN: r0=162(x), r1=241(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 162
LDI r1, 241
LDI r2, 0x000000
PSET r0, r1, r2
HALT
