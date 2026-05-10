; DESCRIPTION: Creates a red circular shape at (410, 93) with radius 27.
; PLAN: r0=410(x), r1=93(y), r2=27(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 410
LDI r1, 93
LDI r2, 27
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
