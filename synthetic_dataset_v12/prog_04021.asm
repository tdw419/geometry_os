; DESCRIPTION: Creates a green circular shape at (249, 93) with radius 68.
; PLAN: r0=249(x), r1=93(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 93
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
