; DESCRIPTION: Creates a red circular shape at (59, 79) with radius 21.
; PLAN: r0=59(x), r1=79(y), r2=21(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 79
LDI r2, 21
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
