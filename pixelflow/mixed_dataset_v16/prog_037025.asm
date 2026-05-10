; DESCRIPTION: Creates a cyan circular shape at (123, 103) with radius 55.
; PLAN: r0=123(x), r1=103(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 103
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
