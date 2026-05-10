; DESCRIPTION: Places a white disk with center (59, 8) and radius 68.
; PLAN: r0=59(x), r1=8(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 8
LDI r2, 68
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
