; DESCRIPTION: Renders a red disk with center (164, 38) and radius 33.
; PLAN: r0=164(x), r1=38(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 38
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
