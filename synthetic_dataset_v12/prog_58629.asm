; DESCRIPTION: Renders a magenta disk with center (398, 153) and radius 33.
; PLAN: r0=398(x), r1=153(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 398
LDI r1, 153
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
