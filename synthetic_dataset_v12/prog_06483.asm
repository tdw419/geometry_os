; DESCRIPTION: Places a magenta circle of radius 42 at center (222, 109).
; PLAN: r0=222(x), r1=109(y), r2=42(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 109
LDI r2, 42
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
