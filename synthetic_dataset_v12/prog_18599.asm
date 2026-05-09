; DESCRIPTION: Creates a red circular shape at (56, 168) with radius 42.
; PLAN: r0=56(x), r1=168(y), r2=42(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 168
LDI r2, 42
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
