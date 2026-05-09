; DESCRIPTION: Creates a cyan circular shape at (107, 132) with radius 64.
; PLAN: r0=107(x), r1=132(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 132
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
