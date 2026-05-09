; DESCRIPTION: Draws a white circle centered at (243, 173) with radius 56.
; PLAN: r0=243(x), r1=173(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 243
LDI r1, 173
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
