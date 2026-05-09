; DESCRIPTION: Renders a magenta disk with center (146, 111) and radius 76.
; PLAN: r0=146(x), r1=111(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 111
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
