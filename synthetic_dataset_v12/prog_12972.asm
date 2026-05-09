; DESCRIPTION: Places a magenta circle of radius 10 at center (82, 28).
; PLAN: r0=82(x), r1=28(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 28
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
