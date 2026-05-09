; DESCRIPTION: Draws a black circle centered at (330, 146) with radius 71.
; PLAN: r0=330(x), r1=146(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 330
LDI r1, 146
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
