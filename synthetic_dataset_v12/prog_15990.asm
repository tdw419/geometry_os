; DESCRIPTION: Creates a yellow circular shape at (338, 146) with radius 79.
; PLAN: r0=338(x), r1=146(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 146
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
