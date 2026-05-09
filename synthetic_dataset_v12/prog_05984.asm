; DESCRIPTION: Renders a red disk with center (492, 221) and radius 18.
; PLAN: r0=492(x), r1=221(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 492
LDI r1, 221
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
