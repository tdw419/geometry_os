; DESCRIPTION: Creates a white circular shape at (410, 115) with radius 42.
; PLAN: r0=410(x), r1=115(y), r2=42(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 410
LDI r1, 115
LDI r2, 42
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
