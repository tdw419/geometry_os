; DESCRIPTION: Creates a cyan circular shape at (123, 150) with radius 78.
; PLAN: r0=123(x), r1=150(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 150
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
