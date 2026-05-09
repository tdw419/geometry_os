; DESCRIPTION: Composite: . Then Places a blue 107x74 rectangle at position (75, 40). Then Places a blue dot at position (49, 130).
; PLAN: r0=75(x), r1=40(y), r2=107(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=49(x), r1=130(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a blue 107x74 rectangle at position (75, 40).
; PLAN: r0=75(x), r1=40(y), r2=107(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 40
LDI r2, 107
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue dot at position (49, 130).
; PLAN: r0=49(x), r1=130(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 49
LDI r1, 130
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
