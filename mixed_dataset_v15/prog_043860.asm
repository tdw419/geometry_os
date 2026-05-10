; DESCRIPTION: Creates a purple circular shape at (298, 150) with radius 69.
; PLAN: r0=298(x), r1=150(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 298
LDI r1, 150
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
