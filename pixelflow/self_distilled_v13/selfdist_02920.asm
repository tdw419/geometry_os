; DESCRIPTION: Draws a white circle centered at (231, 196) with radius 59.
; PLAN: r0=231(x), r1=196(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 196
LDI r2, 59
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
