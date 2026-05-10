; DESCRIPTION: Places a white disk with center (292, 42) and radius 75.
; PLAN: r0=292(x), r1=42(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 42
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
