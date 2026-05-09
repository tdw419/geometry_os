; DESCRIPTION: Renders a red disk with center (74, 117) and radius 47.
; PLAN: r0=74(x), r1=117(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 117
LDI r2, 47
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
