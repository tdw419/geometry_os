; DESCRIPTION: Draws a cyan circle centered at (281, 128) with radius 13.
; PLAN: r0=281(x), r1=128(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 281
LDI r1, 128
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
