; DESCRIPTION: Renders a red disk with center (264, 143) and radius 67.
; PLAN: r0=264(x), r1=143(y), r2=67(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 143
LDI r2, 67
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
