; DESCRIPTION: Places a white disk with center (68, 74) and radius 59.
; PLAN: r0=68(x), r1=74(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 74
LDI r2, 59
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
