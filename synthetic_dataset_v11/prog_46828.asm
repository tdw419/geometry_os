; DESCRIPTION: Composite: . Then Places a purple 107x26 rectangle at position (112, 101). Then Places a black dot at position (171, 170).
; PLAN: r0=112(x), r1=101(y), r2=107(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=171(x), r1=170(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a purple 107x26 rectangle at position (112, 101).
; PLAN: r0=112(x), r1=101(y), r2=107(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 101
LDI r2, 107
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a black dot at position (171, 170).
; PLAN: r0=171(x), r1=170(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 171
LDI r1, 170
LDI r2, 0x000000
PSET r0, r1, r2
HALT
