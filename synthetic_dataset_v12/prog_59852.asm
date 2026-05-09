; DESCRIPTION: Places a white circle of radius 71 at center (174, 98).
; PLAN: r0=174(x), r1=98(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 98
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
