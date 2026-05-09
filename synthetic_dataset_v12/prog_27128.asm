; DESCRIPTION: Places a red circle of radius 49 at center (452, 182).
; PLAN: r0=452(x), r1=182(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 452
LDI r1, 182
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
