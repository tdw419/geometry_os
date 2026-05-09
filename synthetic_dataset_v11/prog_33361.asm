; DESCRIPTION: Composite: . Then Places a purple dot at position (87, 141). Then Places a blue 14x31 rectangle at position (44, 136).
; PLAN: r0=87(x), r1=141(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=44(x), r1=136(y), r2=14(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple dot at position (87, 141).
; PLAN: r0=87(x), r1=141(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 87
LDI r1, 141
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Places a blue 14x31 rectangle at position (44, 136).
; PLAN: r0=44(x), r1=136(y), r2=14(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 136
LDI r2, 14
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
