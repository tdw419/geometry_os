; DESCRIPTION: Renders a red disk with center (154, 108) and radius 11.
; PLAN: r0=154(x), r1=108(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 108
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
