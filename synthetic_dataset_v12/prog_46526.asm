; DESCRIPTION: Creates a blue circular shape at (198, 121) with radius 70.
; PLAN: r0=198(x), r1=121(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 121
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
