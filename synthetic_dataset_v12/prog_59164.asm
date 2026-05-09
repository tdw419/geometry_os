; DESCRIPTION: Places a magenta circle of radius 42 at center (434, 89).
; PLAN: r0=434(x), r1=89(y), r2=42(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 434
LDI r1, 89
LDI r2, 42
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
