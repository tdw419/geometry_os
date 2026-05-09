; DESCRIPTION: Creates a red circular shape at (475, 180) with radius 27.
; PLAN: r0=475(x), r1=180(y), r2=27(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 475
LDI r1, 180
LDI r2, 27
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
