; DESCRIPTION: Composite: . Then Places a purple dot at position (151, 237). Then Places a red 116x98 rectangle at position (71, 19).
; PLAN: r0=151(x), r1=237(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=71(x), r1=19(y), r2=116(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple dot at position (151, 237).
; PLAN: r0=151(x), r1=237(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 151
LDI r1, 237
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Places a red 116x98 rectangle at position (71, 19).
; PLAN: r0=71(x), r1=19(y), r2=116(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 19
LDI r2, 116
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
