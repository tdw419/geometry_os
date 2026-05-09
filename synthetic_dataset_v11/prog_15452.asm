; DESCRIPTION: Composite: . Then Places a cyan circle of radius 30 at center (128, 71). Then Places a white dot at position (54, 107).
; PLAN: r0=128(x), r1=71(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=54(x), r1=107(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a cyan circle of radius 30 at center (128, 71).
; PLAN: r0=128(x), r1=71(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 71
LDI r2, 30
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white dot at position (54, 107).
; PLAN: r0=54(x), r1=107(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 54
LDI r1, 107
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
