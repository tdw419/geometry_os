; DESCRIPTION: Creates a red circular shape at (180, 69) with radius 11.
; PLAN: r0=180(x), r1=69(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 69
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
