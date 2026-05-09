; DESCRIPTION: Draws a cyan circle centered at (329, 143) with radius 64.
; PLAN: r0=329(x), r1=143(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 143
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
