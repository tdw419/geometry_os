; DESCRIPTION: Places a orange circle of radius 51 at center (146, 53).
; PLAN: r0=146(x), r1=53(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 53
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
