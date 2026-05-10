; DESCRIPTION: Places a magenta disk with center (392, 189) and radius 59.
; PLAN: r0=392(x), r1=189(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 189
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
