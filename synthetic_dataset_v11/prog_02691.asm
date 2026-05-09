; DESCRIPTION: Creates a red circular shape at (195, 82) with radius 59.
; PLAN: r0=195(x), r1=82(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 82
LDI r2, 59
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
