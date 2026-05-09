; DESCRIPTION: Renders a red disk with center (37, 221) and radius 33.
; PLAN: r0=37(x), r1=221(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 37
LDI r1, 221
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
