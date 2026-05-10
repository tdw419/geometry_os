; DESCRIPTION: Renders a green rectangular region spanning 51 by 92 at (235, 151).
; PLAN: r0=235(x), r1=151(y), r2=51(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 151
LDI r2, 51
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
