; DESCRIPTION: Places a cyan circle of radius 72 at center (405, 81).
; PLAN: r0=405(x), r1=81(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 81
LDI r2, 72
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
