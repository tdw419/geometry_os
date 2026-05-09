; DESCRIPTION: Composite: . Then Places a white circle of radius 32 at center (202, 89). Then Sets a single purple pixel at (113, 107).
; PLAN: r0=202(x), r1=89(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=113(x), r1=107(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a white circle of radius 32 at center (202, 89).
; PLAN: r0=202(x), r1=89(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 89
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single purple pixel at (113, 107).
; PLAN: r0=113(x), r1=107(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 113
LDI r1, 107
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
