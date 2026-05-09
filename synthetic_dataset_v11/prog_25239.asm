; DESCRIPTION: Composite: . Then Places a purple 93x22 rectangle at position (50, 36). Then Places a purple dot at position (228, 19).
; PLAN: r0=50(x), r1=36(y), r2=93(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=228(x), r1=19(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a purple 93x22 rectangle at position (50, 36).
; PLAN: r0=50(x), r1=36(y), r2=93(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 36
LDI r2, 93
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (228, 19).
; PLAN: r0=228(x), r1=19(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 228
LDI r1, 19
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
