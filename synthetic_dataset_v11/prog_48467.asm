; DESCRIPTION: Draws a cyan circle centered at (128, 133) with radius 62.
; PLAN: r0=128(x), r1=133(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 133
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
