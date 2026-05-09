; DESCRIPTION: Composite: . Then Places a red dot at position (126, 0). Then Places a purple 71x112 rectangle at position (79, 86).
; PLAN: r0=126(x), r1=0(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=79(x), r1=86(y), r2=71(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (126, 0).
; PLAN: r0=126(x), r1=0(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 126
LDI r1, 0
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Places a purple 71x112 rectangle at position (79, 86).
; PLAN: r0=79(x), r1=86(y), r2=71(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 86
LDI r2, 71
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
