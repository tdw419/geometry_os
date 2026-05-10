; DESCRIPTION: Places a cyan circle of radius 57 at center (337, 148).
; PLAN: r0=337(x), r1=148(y), r2=57(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 337
LDI r1, 148
LDI r2, 57
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
