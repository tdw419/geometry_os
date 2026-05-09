; DESCRIPTION: Places a black 93x89 rectangle at position (164, 91).
; PLAN: r0=164(x), r1=91(y), r2=93(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 91
LDI r2, 93
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
