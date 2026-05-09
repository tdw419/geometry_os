; DESCRIPTION: Creates a red circular shape at (262, 164) with radius 65.
; PLAN: r0=262(x), r1=164(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 164
LDI r2, 65
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
