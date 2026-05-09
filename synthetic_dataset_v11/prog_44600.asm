; DESCRIPTION: Composite: . Then Renders a magenta disk with center (72, 169) and radius 54. Then Places a magenta dot at position (188, 64).
; PLAN: r0=72(x), r1=169(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=188(x), r1=64(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a magenta disk with center (72, 169) and radius 54.
; PLAN: r0=72(x), r1=169(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 169
LDI r2, 54
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta dot at position (188, 64).
; PLAN: r0=188(x), r1=64(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 188
LDI r1, 64
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
