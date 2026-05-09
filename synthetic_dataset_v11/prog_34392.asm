; DESCRIPTION: Creates a cyan circular shape at (209, 233) with radius 22.
; PLAN: r0=209(x), r1=233(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 233
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
