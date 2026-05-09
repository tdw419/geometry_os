; DESCRIPTION: Creates a red circular shape at (131, 152) with radius 65.
; PLAN: r0=131(x), r1=152(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 152
LDI r2, 65
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
