; DESCRIPTION: Draws a red circle centered at (242, 181) with radius 13.
; PLAN: r0=242(x), r1=181(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 181
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
