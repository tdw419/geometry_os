; DESCRIPTION: Places a cyan circle of radius 50 at center (204, 50).
; PLAN: r0=204(x), r1=50(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 50
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
