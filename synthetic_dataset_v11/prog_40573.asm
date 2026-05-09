; DESCRIPTION: Composite: . Then Sets a single green pixel at (235, 138). Then Places a black 39x99 rectangle at position (87, 90).
; PLAN: r0=235(x), r1=138(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=87(x), r1=90(y), r2=39(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (235, 138).
; PLAN: r0=235(x), r1=138(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 235
LDI r1, 138
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Places a black 39x99 rectangle at position (87, 90).
; PLAN: r0=87(x), r1=90(y), r2=39(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 90
LDI r2, 39
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
