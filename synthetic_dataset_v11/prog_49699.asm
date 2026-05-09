; DESCRIPTION: Places a cyan circle of radius 30 at center (79, 57).
; PLAN: r0=79(x), r1=57(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 57
LDI r2, 30
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
