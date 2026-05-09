; DESCRIPTION: Renders a red disk with center (394, 193) and radius 18.
; PLAN: r0=394(x), r1=193(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 193
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
