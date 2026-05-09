; DESCRIPTION: Draws a black circle centered at (403, 168) with radius 79.
; PLAN: r0=403(x), r1=168(y), r2=79(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 168
LDI r2, 79
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
