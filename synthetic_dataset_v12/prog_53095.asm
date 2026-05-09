; DESCRIPTION: Creates a red circular shape at (207, 230) with radius 14.
; PLAN: r0=207(x), r1=230(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 230
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
