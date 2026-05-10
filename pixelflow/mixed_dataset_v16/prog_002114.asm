; DESCRIPTION: Creates a red circular shape at (403, 115) with radius 59.
; PLAN: r0=403(x), r1=115(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 115
LDI r2, 59
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
