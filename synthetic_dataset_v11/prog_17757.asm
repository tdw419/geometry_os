; DESCRIPTION: Creates a red circular shape at (206, 86) with radius 10.
; PLAN: r0=206(x), r1=86(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 86
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
