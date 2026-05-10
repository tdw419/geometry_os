; DESCRIPTION: Creates a white circular shape at (392, 180) with radius 18.
; PLAN: r0=392(x), r1=180(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 180
LDI r2, 18
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
