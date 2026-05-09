; DESCRIPTION: Creates a cyan circular shape at (228, 84) with radius 19.
; PLAN: r0=228(x), r1=84(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 228
LDI r1, 84
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
