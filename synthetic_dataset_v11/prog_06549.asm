; DESCRIPTION: Places a cyan circle of radius 50 at center (159, 101).
; PLAN: r0=159(x), r1=101(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 101
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
