; DESCRIPTION: Creates a magenta circular shape at (215, 106) with radius 24.
; PLAN: r0=215(x), r1=106(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 106
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
