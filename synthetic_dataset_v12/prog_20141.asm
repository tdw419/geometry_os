; DESCRIPTION: Places a magenta circle of radius 62 at center (365, 143).
; PLAN: r0=365(x), r1=143(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 143
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
