; DESCRIPTION: Creates a red circular shape at (185, 166) with radius 42.
; PLAN: r0=185(x), r1=166(y), r2=42(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 166
LDI r2, 42
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
