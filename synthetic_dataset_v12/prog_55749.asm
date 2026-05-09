; DESCRIPTION: Draws a black circle centered at (443, 72) with radius 16.
; PLAN: r0=443(x), r1=72(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 443
LDI r1, 72
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
