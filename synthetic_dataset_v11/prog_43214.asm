; DESCRIPTION: Composite: . Then Places a green 31x119 rectangle at position (143, 3). Then Places a black dot at position (156, 87).
; PLAN: r0=143(x), r1=3(y), r2=31(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=156(x), r1=87(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a green 31x119 rectangle at position (143, 3).
; PLAN: r0=143(x), r1=3(y), r2=31(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 3
LDI r2, 31
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a black dot at position (156, 87).
; PLAN: r0=156(x), r1=87(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 156
LDI r1, 87
LDI r2, 0x000000
PSET r0, r1, r2
HALT
