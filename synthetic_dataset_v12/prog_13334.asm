; DESCRIPTION: Creates a cyan circular shape at (292, 61) with radius 27.
; PLAN: r0=292(x), r1=61(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 61
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
