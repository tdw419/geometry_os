; DESCRIPTION: Places a magenta circle of radius 42 at center (323, 87).
; PLAN: r0=323(x), r1=87(y), r2=42(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 87
LDI r2, 42
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
