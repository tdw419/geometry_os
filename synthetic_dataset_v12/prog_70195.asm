; DESCRIPTION: Places a cyan circle of radius 62 at center (403, 98).
; PLAN: r0=403(x), r1=98(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 98
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
