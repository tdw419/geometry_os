; DESCRIPTION: Creates a red circular shape at (226, 150) with radius 43.
; PLAN: r0=226(x), r1=150(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 226
LDI r1, 150
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
