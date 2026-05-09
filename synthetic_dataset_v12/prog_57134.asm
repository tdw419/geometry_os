; DESCRIPTION: Creates a cyan circular shape at (369, 99) with radius 55.
; PLAN: r0=369(x), r1=99(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 369
LDI r1, 99
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
