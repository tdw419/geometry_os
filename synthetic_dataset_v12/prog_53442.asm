; DESCRIPTION: Creates a magenta circular shape at (368, 82) with radius 67.
; PLAN: r0=368(x), r1=82(y), r2=67(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 82
LDI r2, 67
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
