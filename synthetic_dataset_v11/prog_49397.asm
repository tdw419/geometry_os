; DESCRIPTION: Places a cyan circle of radius 75 at center (177, 153).
; PLAN: r0=177(x), r1=153(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 153
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
