; DESCRIPTION: Creates a red circular shape at (48, 199) with radius 16.
; PLAN: r0=48(x), r1=199(y), r2=16(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 48
LDI r1, 199
LDI r2, 16
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
