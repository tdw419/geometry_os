; DESCRIPTION: Renders a red disk with center (262, 154) and radius 79.
; PLAN: r0=262(x), r1=154(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 154
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
