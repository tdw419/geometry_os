; DESCRIPTION: Places a magenta circle of radius 27 at center (177, 218).
; PLAN: r0=177(x), r1=218(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 218
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
