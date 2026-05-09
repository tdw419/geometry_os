; DESCRIPTION: Renders a orange disk with center (73, 221) and radius 24.
; PLAN: r0=73(x), r1=221(y), r2=24(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 221
LDI r2, 24
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
