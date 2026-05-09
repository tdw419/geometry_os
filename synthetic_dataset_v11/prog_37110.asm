; DESCRIPTION: Places a red circle of radius 65 at center (188, 76).
; PLAN: r0=188(x), r1=76(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 76
LDI r2, 65
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
