; DESCRIPTION: Composite: . Then Draws a red circle centered at (135, 106) with radius 74. Then Places a black dot at position (125, 60).
; PLAN: r0=135(x), r1=106(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=125(x), r1=60(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a red circle centered at (135, 106) with radius 74.
; PLAN: r0=135(x), r1=106(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 106
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a black dot at position (125, 60).
; PLAN: r0=125(x), r1=60(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 125
LDI r1, 60
LDI r2, 0x000000
PSET r0, r1, r2
HALT
