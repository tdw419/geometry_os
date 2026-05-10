; DESCRIPTION: Places a magenta disk with center (77, 146) and radius 15.
; PLAN: r0=77(x), r1=146(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 146
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
