; DESCRIPTION: Composite: . Then Renders a black box of size 119x43 starting at (116, 94). Then Places a orange dot at position (197, 145).
; PLAN: r0=116(x), r1=94(y), r2=119(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=197(x), r1=145(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a black box of size 119x43 starting at (116, 94).
; PLAN: r0=116(x), r1=94(y), r2=119(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 94
LDI r2, 119
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (197, 145).
; PLAN: r0=197(x), r1=145(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 197
LDI r1, 145
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
