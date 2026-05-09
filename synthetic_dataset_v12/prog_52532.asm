; DESCRIPTION: Places a cyan circle of radius 56 at center (188, 184).
; PLAN: r0=188(x), r1=184(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 184
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
