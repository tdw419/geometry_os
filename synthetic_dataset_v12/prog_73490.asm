; DESCRIPTION: Places a cyan circle of radius 59 at center (233, 156).
; PLAN: r0=233(x), r1=156(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 233
LDI r1, 156
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
