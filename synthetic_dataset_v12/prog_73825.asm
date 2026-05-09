; DESCRIPTION: Composite: Creates a white circular shape at (392, 128) with radius 46 then Sets a single red pixel at (0, 219).
; PLAN: r0=392(x), r1=128(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=0(x), r6=219(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 392
LDI r1, 128
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 0
LDI r6, 219
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
