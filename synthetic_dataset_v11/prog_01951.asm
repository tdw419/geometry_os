; DESCRIPTION: Composite: . Then Places a blue dot at position (170, 159). Then Places a black 112x59 rectangle at position (102, 76).
; PLAN: r0=170(x), r1=159(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=102(x), r1=76(y), r2=112(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (170, 159).
; PLAN: r0=170(x), r1=159(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 170
LDI r1, 159
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a black 112x59 rectangle at position (102, 76).
; PLAN: r0=102(x), r1=76(y), r2=112(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 76
LDI r2, 112
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
