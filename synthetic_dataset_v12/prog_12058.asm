; DESCRIPTION: Creates a cyan circular shape at (86, 209) with radius 34.
; PLAN: r0=86(x), r1=209(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 209
LDI r2, 34
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
