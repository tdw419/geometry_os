; DESCRIPTION: Places a magenta circle of radius 10 at center (42, 56).
; PLAN: r0=42(x), r1=56(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 42
LDI r1, 56
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
