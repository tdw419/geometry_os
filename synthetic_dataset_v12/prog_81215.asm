; DESCRIPTION: Creates a red circular shape at (262, 150) with radius 68.
; PLAN: r0=262(x), r1=150(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 150
LDI r2, 68
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
