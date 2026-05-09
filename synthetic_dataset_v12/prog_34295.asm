; DESCRIPTION: Creates a orange circular shape at (482, 225) with radius 20.
; PLAN: r0=482(x), r1=225(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 482
LDI r1, 225
LDI r2, 20
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
