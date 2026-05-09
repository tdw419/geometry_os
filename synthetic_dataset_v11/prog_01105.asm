; DESCRIPTION: Renders a red disk with center (107, 153) and radius 68.
; PLAN: r0=107(x), r1=153(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 153
LDI r2, 68
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
