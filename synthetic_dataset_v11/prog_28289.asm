; DESCRIPTION: Places a cyan circle of radius 79 at center (153, 177).
; PLAN: r0=153(x), r1=177(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 177
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
