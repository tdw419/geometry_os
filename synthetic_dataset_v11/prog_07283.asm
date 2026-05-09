; DESCRIPTION: Places a red circle of radius 35 at center (82, 55).
; PLAN: r0=82(x), r1=55(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 55
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
