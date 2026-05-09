; DESCRIPTION: Composite: . Then Places a green dot at position (24, 191). Then Places a white circle of radius 39 at center (125, 184).
; PLAN: r0=24(x), r1=191(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=125(x), r1=184(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green dot at position (24, 191).
; PLAN: r0=24(x), r1=191(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 24
LDI r1, 191
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Places a white circle of radius 39 at center (125, 184).
; PLAN: r0=125(x), r1=184(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 184
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
