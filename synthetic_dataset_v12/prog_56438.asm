; DESCRIPTION: Creates a cyan circular shape at (191, 162) with radius 25.
; PLAN: r0=191(x), r1=162(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 162
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
