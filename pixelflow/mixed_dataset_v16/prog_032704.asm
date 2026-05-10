; DESCRIPTION: Creates a cyan circular shape at (372, 66) with radius 59.
; PLAN: r0=372(x), r1=66(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 66
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
