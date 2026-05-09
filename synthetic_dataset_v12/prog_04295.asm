; DESCRIPTION: Creates a cyan circular shape at (191, 136) with radius 69.
; PLAN: r0=191(x), r1=136(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 136
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
