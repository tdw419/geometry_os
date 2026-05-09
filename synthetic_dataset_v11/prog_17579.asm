; DESCRIPTION: Places a cyan circle of radius 65 at center (165, 115).
; PLAN: r0=165(x), r1=115(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 115
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
