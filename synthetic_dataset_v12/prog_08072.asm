; DESCRIPTION: Creates a cyan circular shape at (69, 84) with radius 27.
; PLAN: r0=69(x), r1=84(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 84
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
