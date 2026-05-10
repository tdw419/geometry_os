; DESCRIPTION: Draws a yellow circle centered at (226, 179) with radius 16.
; PLAN: r0=226(x), r1=179(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 226
LDI r1, 179
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
