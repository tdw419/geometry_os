; DESCRIPTION: Composite: . Then Places a red dot at position (222, 31). Then Renders a orange disk with center (180, 159) and radius 68.
; PLAN: r0=222(x), r1=31(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=180(x), r1=159(y), r2=68(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red dot at position (222, 31).
; PLAN: r0=222(x), r1=31(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 222
LDI r1, 31
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Renders a orange disk with center (180, 159) and radius 68.
; PLAN: r0=180(x), r1=159(y), r2=68(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 159
LDI r2, 68
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
