; DESCRIPTION: Creates a green circular shape at (482, 145) with radius 27.
; PLAN: r0=482(x), r1=145(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 482
LDI r1, 145
LDI r2, 27
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
