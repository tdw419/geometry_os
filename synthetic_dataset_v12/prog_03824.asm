; DESCRIPTION: Creates a white circular shape at (371, 127) with radius 74.
; PLAN: r0=371(x), r1=127(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 127
LDI r2, 74
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
