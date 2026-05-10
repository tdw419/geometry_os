; DESCRIPTION: Renders a red circular shape at (116, 195) with radius 11.
; PLAN: r0=116(x), r1=195(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 195
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
