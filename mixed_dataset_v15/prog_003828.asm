; DESCRIPTION: Places a red circle of radius 47 at center (464, 55).
; PLAN: r0=464(x), r1=55(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 464
LDI r1, 55
LDI r2, 47
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
