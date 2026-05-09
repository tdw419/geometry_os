; DESCRIPTION: Places a white circle of radius 46 at center (340, 141).
; PLAN: r0=340(x), r1=141(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 340
LDI r1, 141
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
