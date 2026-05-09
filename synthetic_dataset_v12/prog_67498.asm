; DESCRIPTION: Renders a red disk with center (326, 173) and radius 73.
; PLAN: r0=326(x), r1=173(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 326
LDI r1, 173
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
