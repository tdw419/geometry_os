; DESCRIPTION: Composite: . Then Places a yellow dot at position (131, 29). Then Places a black 68x117 rectangle at position (155, 97).
; PLAN: r0=131(x), r1=29(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=155(x), r1=97(y), r2=68(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (131, 29).
; PLAN: r0=131(x), r1=29(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 131
LDI r1, 29
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Places a black 68x117 rectangle at position (155, 97).
; PLAN: r0=155(x), r1=97(y), r2=68(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 97
LDI r2, 68
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
