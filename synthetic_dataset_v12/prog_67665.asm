; DESCRIPTION: Places a red circle of radius 58 at center (82, 156).
; PLAN: r0=82(x), r1=156(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 156
LDI r2, 58
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
