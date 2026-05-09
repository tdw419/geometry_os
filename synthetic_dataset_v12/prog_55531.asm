; DESCRIPTION: Places a white circle of radius 36 at center (275, 166).
; PLAN: r0=275(x), r1=166(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 166
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
