; DESCRIPTION: Composite: . Then Places a black 42x93 rectangle at position (118, 20). Then Places a cyan dot at position (170, 152).
; PLAN: r0=118(x), r1=20(y), r2=42(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=170(x), r1=152(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a black 42x93 rectangle at position (118, 20).
; PLAN: r0=118(x), r1=20(y), r2=42(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 20
LDI r2, 42
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan dot at position (170, 152).
; PLAN: r0=170(x), r1=152(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 170
LDI r1, 152
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
