; DESCRIPTION: Composite: . Then Places a yellow 100x119 rectangle at position (120, 125). Then Places a blue dot at position (47, 234).
; PLAN: r0=120(x), r1=125(y), r2=100(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=47(x), r1=234(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow 100x119 rectangle at position (120, 125).
; PLAN: r0=120(x), r1=125(y), r2=100(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 125
LDI r2, 100
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue dot at position (47, 234).
; PLAN: r0=47(x), r1=234(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 47
LDI r1, 234
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
