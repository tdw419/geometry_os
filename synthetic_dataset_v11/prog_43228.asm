; DESCRIPTION: Places a white circle of radius 38 at center (140, 65).
; PLAN: r0=140(x), r1=65(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 65
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
