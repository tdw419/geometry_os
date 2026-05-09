; DESCRIPTION: Composite: . Then Places a white circle of radius 78 at center (169, 100). Then Sets a single cyan pixel at (177, 46).
; PLAN: r0=169(x), r1=100(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=177(x), r1=46(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a white circle of radius 78 at center (169, 100).
; PLAN: r0=169(x), r1=100(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 100
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single cyan pixel at (177, 46).
; PLAN: r0=177(x), r1=46(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 177
LDI r1, 46
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
