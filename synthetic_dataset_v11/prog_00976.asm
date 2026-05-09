; DESCRIPTION: Places a white circle of radius 62 at center (69, 68).
; PLAN: r0=69(x), r1=68(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 68
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
