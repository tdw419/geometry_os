; DESCRIPTION: Places a black circle of radius 50 at center (168, 71).
; PLAN: r0=168(x), r1=71(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 71
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
