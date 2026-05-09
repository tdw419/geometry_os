; DESCRIPTION: Composite: . Then Places a cyan dot at position (114, 85). Then Places a white 18x69 rectangle at position (163, 15).
; PLAN: r0=114(x), r1=85(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=163(x), r1=15(y), r2=18(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (114, 85).
; PLAN: r0=114(x), r1=85(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 114
LDI r1, 85
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Places a white 18x69 rectangle at position (163, 15).
; PLAN: r0=163(x), r1=15(y), r2=18(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 15
LDI r2, 18
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
