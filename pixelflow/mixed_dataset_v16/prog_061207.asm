; DESCRIPTION: Places a magenta disk with center (333, 120) and radius 63.
; PLAN: r0=333(x), r1=120(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 333
LDI r1, 120
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
