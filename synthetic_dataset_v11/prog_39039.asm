; DESCRIPTION: Composite: . Then Draws a red circle centered at (199, 178) with radius 39. Then Places a cyan dot at position (107, 34).
; PLAN: r0=199(x), r1=178(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=107(x), r1=34(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a red circle centered at (199, 178) with radius 39.
; PLAN: r0=199(x), r1=178(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 178
LDI r2, 39
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan dot at position (107, 34).
; PLAN: r0=107(x), r1=34(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 107
LDI r1, 34
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
