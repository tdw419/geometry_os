; DESCRIPTION: Creates a cyan circular shape at (209, 199) with radius 20.
; PLAN: r0=209(x), r1=199(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 199
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
