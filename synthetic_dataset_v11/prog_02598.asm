; DESCRIPTION: Composite: . Then Places a white dot at position (191, 213). Then Draws a red circle centered at (76, 106) with radius 31.
; PLAN: r0=191(x), r1=213(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=76(x), r1=106(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white dot at position (191, 213).
; PLAN: r0=191(x), r1=213(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 191
LDI r1, 213
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a red circle centered at (76, 106) with radius 31.
; PLAN: r0=76(x), r1=106(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 106
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
