; DESCRIPTION: Creates a red circular shape at (220, 161) with radius 62.
; PLAN: r0=220(x), r1=161(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 161
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
