; DESCRIPTION: Places a white disk with center (273, 161) and radius 27.
; PLAN: r0=273(x), r1=161(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 161
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
