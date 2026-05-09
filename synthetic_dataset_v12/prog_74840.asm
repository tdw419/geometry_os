; DESCRIPTION: Renders a magenta disk with center (460, 209) and radius 32.
; PLAN: r0=460(x), r1=209(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 460
LDI r1, 209
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
