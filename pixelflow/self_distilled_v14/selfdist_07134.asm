; DESCRIPTION: Renders a red circular shape at (365, 58) with radius 66.
; PLAN: r0=365(x), r1=58(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 58
LDI r2, 66
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
