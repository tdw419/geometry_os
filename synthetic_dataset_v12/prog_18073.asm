; DESCRIPTION: Draws a yellow circle centered at (365, 152) with radius 73.
; PLAN: r0=365(x), r1=152(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 152
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
