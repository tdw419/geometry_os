; DESCRIPTION: Places a red disk with center (51, 82) and radius 50.
; PLAN: r0=51(x), r1=82(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 82
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
