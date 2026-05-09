; DESCRIPTION: Creates a magenta circular shape at (161, 69) with radius 59.
; PLAN: r0=161(x), r1=69(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 69
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
