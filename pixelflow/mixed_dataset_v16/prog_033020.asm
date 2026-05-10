; DESCRIPTION: Renders a orange circular shape at (101, 131) with radius 75.
; PLAN: r0=101(x), r1=131(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 131
LDI r2, 75
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
