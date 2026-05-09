; DESCRIPTION: Places a cyan circle of radius 57 at center (62, 174).
; PLAN: r0=62(x), r1=174(y), r2=57(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 174
LDI r2, 57
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
