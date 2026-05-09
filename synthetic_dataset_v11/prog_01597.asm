; DESCRIPTION: Composite: . Then Places a cyan circle of radius 64 at center (72, 81). Then Sets a single yellow pixel at (158, 70).
; PLAN: r0=72(x), r1=81(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=158(x), r1=70(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a cyan circle of radius 64 at center (72, 81).
; PLAN: r0=72(x), r1=81(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 81
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single yellow pixel at (158, 70).
; PLAN: r0=158(x), r1=70(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 158
LDI r1, 70
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
