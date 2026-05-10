; DESCRIPTION: Renders a red circular shape at (323, 133) with radius 56.
; PLAN: r0=323(x), r1=133(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 133
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
