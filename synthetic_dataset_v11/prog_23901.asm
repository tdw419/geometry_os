; DESCRIPTION: Composite: . Then Places a blue dot at position (223, 149). Then Places a green 107x23 rectangle at position (47, 217).
; PLAN: r0=223(x), r1=149(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=47(x), r1=217(y), r2=107(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (223, 149).
; PLAN: r0=223(x), r1=149(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 223
LDI r1, 149
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a green 107x23 rectangle at position (47, 217).
; PLAN: r0=47(x), r1=217(y), r2=107(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 217
LDI r2, 107
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
