; DESCRIPTION: Renders a red disk with center (156, 178) and radius 58.
; PLAN: r0=156(x), r1=178(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 178
LDI r2, 58
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
