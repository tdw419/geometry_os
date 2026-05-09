; DESCRIPTION: Creates a red circular shape at (275, 171) with radius 51.
; PLAN: r0=275(x), r1=171(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 171
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
