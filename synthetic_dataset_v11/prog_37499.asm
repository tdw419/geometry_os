; DESCRIPTION: Creates a red circular shape at (72, 164) with radius 60.
; PLAN: r0=72(x), r1=164(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 164
LDI r2, 60
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
