; DESCRIPTION: Places a orange circle of radius 10 at center (28, 177).
; PLAN: r0=28(x), r1=177(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 28
LDI r1, 177
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
