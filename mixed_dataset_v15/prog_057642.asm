; DESCRIPTION: Places a magenta disk with center (235, 179) and radius 66.
; PLAN: r0=235(x), r1=179(y), r2=66(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 235
LDI r1, 179
LDI r2, 66
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
