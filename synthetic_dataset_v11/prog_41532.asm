; DESCRIPTION: Places a cyan circle of radius 62 at center (122, 173).
; PLAN: r0=122(x), r1=173(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 173
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
