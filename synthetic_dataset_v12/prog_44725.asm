; DESCRIPTION: Creates a magenta circular shape at (302, 152) with radius 44.
; PLAN: r0=302(x), r1=152(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 152
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
