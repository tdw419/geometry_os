; DESCRIPTION: Creates a blue circular shape at (284, 193) with radius 18.
; PLAN: r0=284(x), r1=193(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 284
LDI r1, 193
LDI r2, 18
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
