; DESCRIPTION: Creates a cyan circular shape at (260, 162) with radius 22.
; PLAN: r0=260(x), r1=162(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 260
LDI r1, 162
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
