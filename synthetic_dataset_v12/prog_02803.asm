; DESCRIPTION: Creates a red circular shape at (326, 178) with radius 43.
; PLAN: r0=326(x), r1=178(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 326
LDI r1, 178
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
