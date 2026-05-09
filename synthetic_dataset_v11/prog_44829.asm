; DESCRIPTION: Composite: . Then Places a black 118x71 rectangle at position (36, 41). Then Places a yellow dot at position (4, 58).
; PLAN: r0=36(x), r1=41(y), r2=118(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=4(x), r1=58(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a black 118x71 rectangle at position (36, 41).
; PLAN: r0=36(x), r1=41(y), r2=118(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 41
LDI r2, 118
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (4, 58).
; PLAN: r0=4(x), r1=58(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 4
LDI r1, 58
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
