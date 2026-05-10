; DESCRIPTION: Draws a red circle centered at (245, 89) with radius 72.
; PLAN: r0=245(x), r1=89(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 89
LDI r2, 72
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
