; DESCRIPTION: Composite: . Then Places a white dot at position (140, 35). Then Draws a red circle centered at (44, 50) with radius 44.
; PLAN: r0=140(x), r1=35(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=44(x), r1=50(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white dot at position (140, 35).
; PLAN: r0=140(x), r1=35(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 140
LDI r1, 35
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a red circle centered at (44, 50) with radius 44.
; PLAN: r0=44(x), r1=50(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 50
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
