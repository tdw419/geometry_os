; DESCRIPTION: Composite: . Then Draws a cyan circle centered at (146, 136) with radius 34. Then Sets a single yellow pixel at (106, 195).
; PLAN: r0=146(x), r1=136(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=106(x), r1=195(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a cyan circle centered at (146, 136) with radius 34.
; PLAN: r0=146(x), r1=136(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 136
LDI r2, 34
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single yellow pixel at (106, 195).
; PLAN: r0=106(x), r1=195(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 106
LDI r1, 195
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
