; DESCRIPTION: Renders a red circular shape at (272, 82) with radius 32.
; PLAN: r0=272(x), r1=82(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 82
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
