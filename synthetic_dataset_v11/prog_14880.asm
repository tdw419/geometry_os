; DESCRIPTION: Creates a red circular shape at (21, 229) with radius 15.
; PLAN: r0=21(x), r1=229(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 21
LDI r1, 229
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
