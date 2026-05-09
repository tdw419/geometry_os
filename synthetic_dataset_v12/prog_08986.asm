; DESCRIPTION: Renders a red disk with center (261, 16) and radius 15.
; PLAN: r0=261(x), r1=16(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 16
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
