; DESCRIPTION: Renders a red disk with center (173, 140) and radius 22.
; PLAN: r0=173(x), r1=140(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 140
LDI r2, 22
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
