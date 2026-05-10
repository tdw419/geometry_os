; DESCRIPTION: Creates a red circular shape at (256, 180) with radius 60.
; PLAN: r0=256(x), r1=180(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 180
LDI r2, 60
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
