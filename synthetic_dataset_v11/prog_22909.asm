; DESCRIPTION: Composite: . Then Renders a cyan disk with center (30, 126) and radius 29. Then Places a orange dot at position (207, 158).
; PLAN: r0=30(x), r1=126(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=207(x), r1=158(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a cyan disk with center (30, 126) and radius 29.
; PLAN: r0=30(x), r1=126(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 30
LDI r1, 126
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange dot at position (207, 158).
; PLAN: r0=207(x), r1=158(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 207
LDI r1, 158
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
