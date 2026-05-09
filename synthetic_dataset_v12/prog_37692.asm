; DESCRIPTION: Renders a red disk with center (365, 145) and radius 30.
; PLAN: r0=365(x), r1=145(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 145
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
