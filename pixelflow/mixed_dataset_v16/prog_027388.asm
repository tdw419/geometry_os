; DESCRIPTION: Creates a magenta circular shape at (445, 48) with radius 33.
; PLAN: r0=445(x), r1=48(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 445
LDI r1, 48
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
