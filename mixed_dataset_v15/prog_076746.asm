; DESCRIPTION: Draws a cyan circle centered at (128, 108) with radius 77.
; PLAN: r0=128(x), r1=108(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 108
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
