; DESCRIPTION: Creates a red circular shape at (482, 79) with radius 23.
; PLAN: r0=482(x), r1=79(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 482
LDI r1, 79
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
