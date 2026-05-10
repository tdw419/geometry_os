; DESCRIPTION: Renders a red circular shape at (317, 10) with radius 56.
; PLAN: r0=317(x), r1=10(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 317
LDI r1, 10
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
