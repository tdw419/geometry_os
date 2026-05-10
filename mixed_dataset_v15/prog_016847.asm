; DESCRIPTION: Places a white disk with center (46, 93) and radius 12.
; PLAN: r0=46(x), r1=93(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 46
LDI r1, 93
LDI r2, 12
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
