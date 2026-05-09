; DESCRIPTION: Renders a magenta disk with center (57, 146) and radius 54.
; PLAN: r0=57(x), r1=146(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 57
LDI r1, 146
LDI r2, 54
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
