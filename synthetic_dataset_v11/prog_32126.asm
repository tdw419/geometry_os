; DESCRIPTION: Places a cyan circle of radius 61 at center (86, 93).
; PLAN: r0=86(x), r1=93(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 93
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
