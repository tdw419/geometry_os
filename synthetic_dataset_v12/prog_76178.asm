; DESCRIPTION: Creates a green circular shape at (392, 128) with radius 57.
; PLAN: r0=392(x), r1=128(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 128
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
