; DESCRIPTION: Places a cyan circle of radius 74 at center (311, 153).
; PLAN: r0=311(x), r1=153(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 153
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
