; DESCRIPTION: Composite: . Then Draws a white circle centered at (114, 134) with radius 71. Then Sets a single cyan pixel at (21, 255).
; PLAN: r0=114(x), r1=134(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=21(x), r1=255(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a white circle centered at (114, 134) with radius 71.
; PLAN: r0=114(x), r1=134(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 134
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single cyan pixel at (21, 255).
; PLAN: r0=21(x), r1=255(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 21
LDI r1, 255
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
