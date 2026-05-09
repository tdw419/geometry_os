; DESCRIPTION: Composite: . Then Places a white dot at position (175, 129). Then Places a cyan circle of radius 19 at center (49, 193).
; PLAN: r0=175(x), r1=129(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=49(x), r1=193(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white dot at position (175, 129).
; PLAN: r0=175(x), r1=129(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 175
LDI r1, 129
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Places a cyan circle of radius 19 at center (49, 193).
; PLAN: r0=49(x), r1=193(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 193
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
