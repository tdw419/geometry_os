; DESCRIPTION: Renders a magenta disk with center (82, 91) and radius 39.
; PLAN: r0=82(x), r1=91(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 91
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
