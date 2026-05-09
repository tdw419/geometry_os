; DESCRIPTION: Creates a magenta circular shape at (387, 122) with radius 47.
; PLAN: r0=387(x), r1=122(y), r2=47(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 122
LDI r2, 47
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
