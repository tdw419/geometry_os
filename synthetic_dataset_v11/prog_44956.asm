; DESCRIPTION: Renders a blue disk with center (113, 179) and radius 50.
; PLAN: r0=113(x), r1=179(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 179
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
