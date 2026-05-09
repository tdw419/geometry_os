; DESCRIPTION: Composite: . Then Places a black dot at position (188, 24). Then Renders a black box of size 45x101 starting at (25, 93).
; PLAN: r0=188(x), r1=24(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=25(x), r1=93(y), r2=45(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (188, 24).
; PLAN: r0=188(x), r1=24(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 188
LDI r1, 24
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Renders a black box of size 45x101 starting at (25, 93).
; PLAN: r0=25(x), r1=93(y), r2=45(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 93
LDI r2, 45
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
