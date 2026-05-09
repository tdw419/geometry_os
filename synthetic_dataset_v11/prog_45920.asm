; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (232, 155). Then Draws a red circle centered at (129, 93) with radius 50.
; PLAN: r0=232(x), r1=155(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=129(x), r1=93(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single cyan pixel at (232, 155).
; PLAN: r0=232(x), r1=155(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 232
LDI r1, 155
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a red circle centered at (129, 93) with radius 50.
; PLAN: r0=129(x), r1=93(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 93
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
