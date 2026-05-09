; DESCRIPTION: Places a cyan circle of radius 79 at center (79, 100).
; PLAN: r0=79(x), r1=100(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 100
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
