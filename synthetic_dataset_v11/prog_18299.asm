; DESCRIPTION: Renders a red disk with center (158, 116) and radius 42.
; PLAN: r0=158(x), r1=116(y), r2=42(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 116
LDI r2, 42
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
