; DESCRIPTION: Creates a red circular shape at (146, 142) with radius 64.
; PLAN: r0=146(x), r1=142(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 142
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
