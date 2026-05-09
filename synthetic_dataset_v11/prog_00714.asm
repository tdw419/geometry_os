; DESCRIPTION: Composite: . Then Sets a single white pixel at (55, 169). Then Places a white 118x61 rectangle at position (40, 51).
; PLAN: r0=55(x), r1=169(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=40(x), r1=51(y), r2=118(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (55, 169).
; PLAN: r0=55(x), r1=169(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 55
LDI r1, 169
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Places a white 118x61 rectangle at position (40, 51).
; PLAN: r0=40(x), r1=51(y), r2=118(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 51
LDI r2, 118
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
