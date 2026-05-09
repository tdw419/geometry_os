; DESCRIPTION: Renders a magenta disk with center (94, 125) and radius 42.
; PLAN: r0=94(x), r1=125(y), r2=42(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 125
LDI r2, 42
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
