; DESCRIPTION: Creates a white circular shape at (392, 164) with radius 14.
; PLAN: r0=392(x), r1=164(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 164
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
