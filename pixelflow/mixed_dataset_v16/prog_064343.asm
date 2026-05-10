; DESCRIPTION: Creates a red circular shape at (292, 209) with radius 32.
; PLAN: r0=292(x), r1=209(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 209
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
