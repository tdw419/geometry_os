; DESCRIPTION: Composite: . Then Sets a single green pixel at (167, 107). Then Renders a orange disk with center (138, 134) and radius 77.
; PLAN: r0=167(x), r1=107(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=138(x), r1=134(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single green pixel at (167, 107).
; PLAN: r0=167(x), r1=107(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 167
LDI r1, 107
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Renders a orange disk with center (138, 134) and radius 77.
; PLAN: r0=138(x), r1=134(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 134
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
