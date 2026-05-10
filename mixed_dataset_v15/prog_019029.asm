; DESCRIPTION: Places a magenta disk with center (262, 41) and radius 23.
; PLAN: r0=262(x), r1=41(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 41
LDI r2, 23
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
