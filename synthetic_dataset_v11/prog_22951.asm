; DESCRIPTION: Composite: . Then Draws a cyan circle centered at (118, 47) with radius 43. Then Sets a single green pixel at (135, 20).
; PLAN: r0=118(x), r1=47(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=135(x), r1=20(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a cyan circle centered at (118, 47) with radius 43.
; PLAN: r0=118(x), r1=47(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 47
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single green pixel at (135, 20).
; PLAN: r0=135(x), r1=20(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 135
LDI r1, 20
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
