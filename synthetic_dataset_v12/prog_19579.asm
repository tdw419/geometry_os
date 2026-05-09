; DESCRIPTION: Renders a magenta disk with center (198, 164) and radius 34.
; PLAN: r0=198(x), r1=164(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 164
LDI r2, 34
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
