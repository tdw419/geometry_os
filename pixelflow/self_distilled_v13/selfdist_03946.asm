; DESCRIPTION: Places a magenta disk with center (398, 62) and radius 28.
; PLAN: r0=398(x), r1=62(y), r2=28(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 398
LDI r1, 62
LDI r2, 28
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
