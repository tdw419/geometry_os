; DESCRIPTION: Composite: . Then Places a black dot at position (69, 99). Then Renders a black box of size 71x93 starting at (24, 142).
; PLAN: r0=69(x), r1=99(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=24(x), r1=142(y), r2=71(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (69, 99).
; PLAN: r0=69(x), r1=99(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 69
LDI r1, 99
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Renders a black box of size 71x93 starting at (24, 142).
; PLAN: r0=24(x), r1=142(y), r2=71(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 142
LDI r2, 71
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
