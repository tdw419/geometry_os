; DESCRIPTION: Composite: . Then Draws a cyan circle centered at (140, 171) with radius 26. Then Sets a single red pixel at (217, 171).
; PLAN: r0=140(x), r1=171(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=217(x), r1=171(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a cyan circle centered at (140, 171) with radius 26.
; PLAN: r0=140(x), r1=171(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 171
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single red pixel at (217, 171).
; PLAN: r0=217(x), r1=171(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 217
LDI r1, 171
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
