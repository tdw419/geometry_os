; DESCRIPTION: Draws a white circle centered at (294, 162) with radius 40.
; PLAN: r0=294(x), r1=162(y), r2=40(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 294
LDI r1, 162
LDI r2, 40
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
