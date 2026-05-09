; DESCRIPTION: Creates a green circular shape at (443, 164) with radius 56.
; PLAN: r0=443(x), r1=164(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 443
LDI r1, 164
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
