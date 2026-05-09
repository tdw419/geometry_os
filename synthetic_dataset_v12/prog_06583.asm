; DESCRIPTION: Creates a red circular shape at (218, 212) with radius 17.
; PLAN: r0=218(x), r1=212(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 212
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
