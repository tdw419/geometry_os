; DESCRIPTION: Creates a cyan circular shape at (197, 63) with radius 34.
; PLAN: r0=197(x), r1=63(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 63
LDI r2, 34
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
