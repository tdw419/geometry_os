; DESCRIPTION: Composite: . Then Sets a single green pixel at (159, 124). Then Renders a purple box of size 46x23 starting at (177, 165).
; PLAN: r0=159(x), r1=124(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=177(x), r1=165(y), r2=46(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (159, 124).
; PLAN: r0=159(x), r1=124(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 159
LDI r1, 124
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Renders a purple box of size 46x23 starting at (177, 165).
; PLAN: r0=177(x), r1=165(y), r2=46(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 165
LDI r2, 46
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
