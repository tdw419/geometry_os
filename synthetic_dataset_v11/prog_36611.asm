; DESCRIPTION: Places a orange circle of radius 52 at center (113, 183).
; PLAN: r0=113(x), r1=183(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 183
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
