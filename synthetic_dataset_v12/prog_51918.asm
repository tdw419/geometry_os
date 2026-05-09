; DESCRIPTION: Draws a white circle centered at (284, 110) with radius 20.
; PLAN: r0=284(x), r1=110(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 284
LDI r1, 110
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
