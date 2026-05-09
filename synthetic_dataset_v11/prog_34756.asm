; DESCRIPTION: Creates a red circular shape at (196, 42) with radius 13.
; PLAN: r0=196(x), r1=42(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 42
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
