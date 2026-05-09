; DESCRIPTION: Renders a red disk with center (120, 154) and radius 34.
; PLAN: r0=120(x), r1=154(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 154
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
