; DESCRIPTION: Renders a red disk with center (113, 172) and radius 13.
; PLAN: r0=113(x), r1=172(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 172
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
