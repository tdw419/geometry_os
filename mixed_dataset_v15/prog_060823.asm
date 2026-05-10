; DESCRIPTION: Places a white circle of radius 29 at center (367, 166).
; PLAN: r0=367(x), r1=166(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 166
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
