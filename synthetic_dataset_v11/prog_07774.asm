; DESCRIPTION: Composite: . Then Places a purple 31x108 rectangle at position (17, 41). Then Places a black dot at position (185, 125).
; PLAN: r0=17(x), r1=41(y), r2=31(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=185(x), r1=125(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a purple 31x108 rectangle at position (17, 41).
; PLAN: r0=17(x), r1=41(y), r2=31(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 41
LDI r2, 31
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a black dot at position (185, 125).
; PLAN: r0=185(x), r1=125(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 185
LDI r1, 125
LDI r2, 0x000000
PSET r0, r1, r2
HALT
