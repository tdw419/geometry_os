; DESCRIPTION: Draws a cyan circle centered at (46, 128) with radius 22.
; PLAN: r0=46(x), r1=128(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 46
LDI r1, 128
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
