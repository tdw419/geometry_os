; DESCRIPTION: Renders a blue line segment connecting (92, 142) to (257, 32).
; PLAN: r0=92(x1), r1=142(y1), r2=257(x2), r3=32(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 142
LDI r2, 257
LDI r3, 32
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
