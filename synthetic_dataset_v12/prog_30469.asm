; DESCRIPTION: Places a red circle of radius 73 at center (245, 95).
; PLAN: r0=245(x), r1=95(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 95
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
