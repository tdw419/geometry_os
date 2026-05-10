; DESCRIPTION: Renders a red circular shape at (127, 10) with radius 11.
; PLAN: r0=127(x), r1=10(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 10
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
