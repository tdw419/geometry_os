; DESCRIPTION: Composite: . Then Places a orange 93x18 rectangle at position (159, 237). Then Places a yellow dot at position (178, 106).
; PLAN: r0=159(x), r1=237(y), r2=93(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=178(x), r1=106(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a orange 93x18 rectangle at position (159, 237).
; PLAN: r0=159(x), r1=237(y), r2=93(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 237
LDI r2, 93
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (178, 106).
; PLAN: r0=178(x), r1=106(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 178
LDI r1, 106
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
