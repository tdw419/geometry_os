; DESCRIPTION: Draws a cyan circle centered at (128, 121) with radius 80.
; PLAN: r0=128(x), r1=121(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 121
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
