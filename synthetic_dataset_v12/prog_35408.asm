; DESCRIPTION: Creates a red circular shape at (446, 45) with radius 36.
; PLAN: r0=446(x), r1=45(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 446
LDI r1, 45
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
