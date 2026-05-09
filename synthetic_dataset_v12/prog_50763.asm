; DESCRIPTION: Places a red circle of radius 42 at center (285, 118).
; PLAN: r0=285(x), r1=118(y), r2=42(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 285
LDI r1, 118
LDI r2, 42
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
