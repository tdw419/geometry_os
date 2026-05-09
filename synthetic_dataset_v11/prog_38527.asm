; DESCRIPTION: Places a red circle of radius 46 at center (103, 55).
; PLAN: r0=103(x), r1=55(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 55
LDI r2, 46
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
