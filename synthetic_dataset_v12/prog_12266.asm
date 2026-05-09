; DESCRIPTION: Places a orange circle of radius 69 at center (368, 177).
; PLAN: r0=368(x), r1=177(y), r2=69(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 177
LDI r2, 69
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
