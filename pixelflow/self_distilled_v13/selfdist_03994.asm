; DESCRIPTION: Renders a orange circular shape at (133, 93) with radius 18.
; PLAN: r0=133(x), r1=93(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 93
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
