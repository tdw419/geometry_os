; DESCRIPTION: Renders a magenta disk with center (433, 126) and radius 79.
; PLAN: r0=433(x), r1=126(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 126
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
