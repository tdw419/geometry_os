; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (148, 164). Then Draws a red circle centered at (136, 135) with radius 50.
; PLAN: r0=148(x), r1=164(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=136(x), r1=135(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single cyan pixel at (148, 164).
; PLAN: r0=148(x), r1=164(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 148
LDI r1, 164
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a red circle centered at (136, 135) with radius 50.
; PLAN: r0=136(x), r1=135(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 135
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
