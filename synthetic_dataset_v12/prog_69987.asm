; DESCRIPTION: Draws a white circle centered at (242, 71) with radius 47.
; PLAN: r0=242(x), r1=71(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 71
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
