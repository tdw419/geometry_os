; DESCRIPTION: Draws a black circle centered at (242, 146) with radius 49.
; PLAN: r0=242(x), r1=146(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 146
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
