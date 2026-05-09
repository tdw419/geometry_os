; DESCRIPTION: Places a cyan circle of radius 38 at center (403, 191).
; PLAN: r0=403(x), r1=191(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 191
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
