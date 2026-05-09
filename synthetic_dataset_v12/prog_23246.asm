; DESCRIPTION: Places a black circle of radius 50 at center (214, 89).
; PLAN: r0=214(x), r1=89(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 89
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
